<?php
$connection = pg_connect ("host=localhost dbname=iriusprod
user=iriusprod password=iriusprod");
if($connection) {
echo 'connected';
} else {
echo 'there has been an error connecting';
}
?>
