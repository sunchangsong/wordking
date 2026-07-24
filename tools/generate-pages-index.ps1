param(
    [string] $SiteUrl = "https://sunchangsong.github.io/wordking"
)

Set-StrictMode -Version Latest

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$excludedRootDirs = @(".git", "assets", "tools")

function HtmlEncode([string] $value) {
    return [System.Net.WebUtility]::HtmlEncode($value)
}

function LabelName([string] $value) {
    return $value -replace "_", " "
}

function RelativeCss([int] $depth) {
    if ($depth -eq 0) {
        return "assets/site.css"
    }

    return (("../" * $depth) + "assets/site.css")
}

function Write-Utf8File([string] $path, [string] $content) {
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($path, $content, $utf8NoBom)
}

function PageShell([string] $title, [string] $body, [int] $depth) {
    $css = RelativeCss $depth
    $encodedTitle = HtmlEncode $title
    return @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$encodedTitle</title>
  <link rel="stylesheet" href="$css">
</head>
<body>
  <main class="page">
$body
  </main>
</body>
</html>
"@
}

function FormatDocTitle([System.IO.FileInfo] $file) {
    $stem = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    if ($stem -match "^(\d{4})(\d{2})(\d{2})$") {
        return "$($Matches[1])-$($Matches[2])-$($Matches[3])"
    }

    return LabelName $stem
}

function SiteUrlFor([string[]] $segments) {
    $base = $SiteUrl.TrimEnd("/")
    if ($segments.Count -eq 0) {
        return "$base/"
    }

    $encodedSegments = foreach ($segment in $segments) {
        [System.Uri]::EscapeDataString($segment)
    }

    return "$base/$($encodedSegments -join "/")"
}

$sourceDirs = @(Get-ChildItem -LiteralPath $repoRoot -Directory |
    Where-Object { $excludedRootDirs -notcontains $_.Name } |
    Sort-Object Name)

$sitemapUrls = New-Object System.Collections.Generic.List[string]
$sitemapUrls.Add((SiteUrlFor @()))

$sourceItems = foreach ($source in $sourceDirs) {
    $targetCount = (Get-ChildItem -LiteralPath $source.FullName -Directory | Measure-Object).Count
    @"
      <a class="tile" href="$($source.Name)/">
        <strong>$(HtmlEncode (LabelName $source.Name))</strong>
        <span>$targetCount learning languages</span>
      </a>
"@
}

$rootBody = @"
    <nav class="breadcrumbs" aria-label="Breadcrumbs">
      <span>WordKing</span>
    </nav>
    <header class="hero">
      <div>
        <p class="eyebrow">Vocabulary learning documentation</p>
        <h1>Choose the language you want to learn</h1>
        <p class="lead">Browse WordKing documentation in a crawlable three-level structure: learning language, interface language, and document.</p>
      </div>
      <div class="downloads">
        <a class="button primary" href="https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front">Android</a>
        <a class="button" href="https://apps.apple.com/us/app/wordking-language-learning/id6742090263">iOS</a>
      </div>
    </header>
    <section class="section">
      <div class="section-title">
        <h2>Learning Languages</h2>
        <span>$($sourceDirs.Count) languages</span>
      </div>
      <div class="grid">
$($sourceItems -join "`n")
      </div>
    </section>
"@

Write-Utf8File (Join-Path $repoRoot "index.html") (PageShell "WordKing Documentation" $rootBody 0)

foreach ($source in $sourceDirs) {
    $targetDirs = @(Get-ChildItem -LiteralPath $source.FullName -Directory | Sort-Object Name)
    $targetItems = foreach ($target in $targetDirs) {
        $docCount = (Get-ChildItem -LiteralPath $target.FullName -File -Filter "*.md" | Measure-Object).Count
        @"
        <a class="tile" href="$($target.Name)/">
          <strong>$(HtmlEncode (LabelName $target.Name))</strong>
          <span>$docCount documents</span>
        </a>
"@
    }

    $sourceLabel = HtmlEncode (LabelName $source.Name)
    $sourceBody = @"
    <nav class="breadcrumbs" aria-label="Breadcrumbs">
      <a href="../">WordKing</a>
      <span>$sourceLabel</span>
    </nav>
    <header class="hero compact">
      <div>
        <p class="eyebrow">Learning language</p>
        <h1>$sourceLabel</h1>
        <p class="lead">Choose the language you want to use while learning $sourceLabel.</p>
      </div>
    </header>
    <section class="section">
      <div class="section-title">
        <h2>Use These Languages</h2>
        <span>$($targetDirs.Count) languages</span>
      </div>
      <div class="grid">
$($targetItems -join "`n")
      </div>
    </section>
"@

    Write-Utf8File (Join-Path $source.FullName "index.html") (PageShell "$sourceLabel - WordKing" $sourceBody 1)
    $sitemapUrls.Add((SiteUrlFor @($source.Name, "")))

    foreach ($target in $targetDirs) {
        $docs = @(Get-ChildItem -LiteralPath $target.FullName -File -Filter "*.md" | Sort-Object Name)
        $docItems = foreach ($doc in $docs) {
            $docTitle = HtmlEncode (FormatDocTitle $doc)
            $href = [System.IO.Path]::GetFileNameWithoutExtension($doc.Name) + ".html"
            @"
        <a class="tile" href="$href">
          <strong>$docTitle</strong>
          <span>Introduction document</span>
        </a>
"@
        }

        $targetLabel = HtmlEncode (LabelName $target.Name)
        $targetBody = @"
    <nav class="breadcrumbs" aria-label="Breadcrumbs">
      <a href="../../">WordKing</a>
      <a href="../">$sourceLabel</a>
      <span>$targetLabel</span>
    </nav>
    <header class="hero compact">
      <div>
        <p class="eyebrow">Document language</p>
        <h1>$sourceLabel in $targetLabel</h1>
        <p class="lead">Available WordKing introduction documents for this language pair.</p>
      </div>
    </header>
    <section class="section">
      <div class="section-title">
        <h2>Documents</h2>
        <span>$($docs.Count) documents</span>
      </div>
      <div class="grid">
$($docItems -join "`n")
      </div>
    </section>
"@

        Write-Utf8File (Join-Path $target.FullName "index.html") (PageShell "$sourceLabel in $targetLabel - WordKing" $targetBody 2)
        $sitemapUrls.Add((SiteUrlFor @($source.Name, $target.Name, "")))

        foreach ($doc in $docs) {
            $docHref = [System.IO.Path]::GetFileNameWithoutExtension($doc.Name) + ".html"
            $sitemapUrls.Add((SiteUrlFor @($source.Name, $target.Name, $docHref)))
        }
    }
}

$sitemapItems = foreach ($url in $sitemapUrls) {
    "  <url><loc>$(HtmlEncode $url)</loc></url>"
}

$sitemap = @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
$($sitemapItems -join "`n")
</urlset>
"@

$robots = @"
User-agent: *
Allow: /

Sitemap: $($SiteUrl.TrimEnd("/"))/sitemap.xml
"@

Write-Utf8File (Join-Path $repoRoot "sitemap.xml") $sitemap
Write-Utf8File (Join-Path $repoRoot "robots.txt") $robots

Write-Host "Generated layered GitHub Pages indexes."
