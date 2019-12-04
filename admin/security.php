<?php

// $text = '<p>Tést-para paragraph .</p><!-- Comment --> <a href="/manuel-php/" data-lbox="1" title="Manuel PHP - Other text">ùther tàxt</a>';

// echo strip_tags($text);


function cleanField($tab){
    unset($tab[array_search($tab['submit'], $tab)]);
    unset($tab[array_search('ENREGISTRER', $tab)]);
    foreach ($tab as $key => $value) {
        $tab[$key] = cleanValue($value);
    }
    return $tab;
}

function cleanValue ($string) {
    $string = strip_tags($string);
    $string = addslashes($string);
    $string = trim($string);
    return $string;
}