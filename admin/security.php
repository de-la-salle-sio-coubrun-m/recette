<?php

// $text = '<p>Tést-para paragraph .</p><!-- Comment --> <a href="/manuel-php/" data-lbox="1" title="Manuel PHP - Other text">ùther tàxt</a>';

// echo strip_tags($text);


function security($tab){
    
    array_pop($tab);
    array_slice($tab, -1);
    for($i = 0; $i < sizeof($tab);$i++){
        $tab[$i] = trim($tab[$i]);
        $tab[$i] = strip_tags($tab[$i]);
    }

    return $tab;
}