<?php
/**
 * 
 * Version 1.1 Stand 30.01.2013
 * 
 * Inclusive Wasserzeichen-Funktion
 */
class thumbnail
{
 
        var $img;
        var $fileInfo;
        var $fullName;
        var $newX;
        var $newY;
        var $quality;
        var $orgX;
        var $orgY;
 
        // $data - (voller) Dateiname oder String (z.B. aus Datenbank)
        function create($data)
        {
 
                $this->destroy();
 
                if (file_exists($data)) {
                        $this->img = @imagecreatefromjpeg($data);
                        $this->fileInfo = basename($data);
                        $this->fullName = $data;
                } else {
                        $this->img = @imagecreatefromstring($data);
                }
 
                if (!$this->img) {
                        $this->destroy();
                        return false;
                } else {
                        $this->orgX = imagesx($this->img);
                        $this->orgY = imagesy($this->img);
                        return true;
                }
        }
 
        // H�he des aktuellen Bildes im Container zur�ckgeben, false bei Fehler
        function height()
        {
                if ($this->img) {
                        return imagesy($this->img);
                } else {
                        return false;
                }
        }
 
        // Breite des aktuellen Bildes im Container zur�ckgeben, false bei Fehler
        function width()
        {
                if ($this->img) {
                        return imagesx($this->img);
                } else {
                        return false;
                }
        }
 
        // Qualit�t f�r Ausgabe setzen
        function setQuality($quality = false)
        {
                if ($this->img && $quality) {
                        $this->quality = $quality;
                } else {
                        return false;
                }
        }
 
        // Thumbnail erzeugen
        function resize($newX = false,$newY = false)
        {
                if ($this->img) {
 
                        $X = imagesx($this->img);
                        $Y = imagesy($this->img);
 
                        $newX = $this->_convert($newX,$X);
                        $newY = $this->_convert($newY,$Y);
 
                        if (!$newX && !$newY) {
                                $newX = $X;
                                $newY = $Y;
                        }
 
                        if (!$newX) {
                                $newX = round($X / ($Y / $newY));
                        }
 
                        if (!$newY) {
                                $newY = round($Y / ( $X / $newX));
                        }
 
                        if ( ! $newimg = imagecreatetruecolor($newX,$newY)) {
                                $newimg = imagecreate($newX,$newY);
                        }
 
                        if ( ! imagecopyresampled ($newimg, $this->img, 0, 0, 0, 0, $newX, $newY,$X,$Y)) {
                                imagecopyresized ($newimg, $this->img, 0, 0, 0, 0, $newX, $newY,$X,$Y);
                        }
 
                        $this->img = $newimg;
 
                        return true;
                } else return false;
        }

		function xyz() {
			return $this->img;
		}

		// Fügt Wasserzeichen ein (FUNKTION VON TIMO SCHNEIDER)
		function watermark($file='', $padding=0) {
			
			if ($this->img and $file !='') {
			
				//Originalbild aus Objekt
				$newimg = $this->img;
				$newimgW = imagesx($this->img);
				$newimgH = imagesy($this->img);
				imagealphablending($this->img, true); // Falls das Logo keine Transparenz hat raus nehmen!
				
				//wasserzeichen
				$watermark = imagecreatefrompng($file);
				$watermarkW = imagesx($watermark);
				$watermarkH = imagesy($watermark);
				
				if($padding>0) {
					//Neue Groesse festlegen
					$watermarkNewW = $newimgW - (2 * $padding);
					$watermarkNewH = round($watermarkH / ($watermarkW / $watermarkNewW));						
		
					//Wasserzeichen Groesse anpassen
					$watermarkNew = imagecreate($watermarkNewW, $watermarkNewH);
		
					if ( ! imagecopyresampled ($watermarkNew, $watermark, 0, 0, 0, 0, $watermarkNewW, $watermarkNewH, $watermarkW, $watermarkH)) {
						imagecopyresized ($watermarkNew, $watermark, 0, 0, 0, 0, $watermarkNewW, $watermarkNewH, $watermarkW, $watermarkH);
					}
				}
				else {
					$watermarkNewW = $watermarkW;
					$watermarkNewH = $watermarkH;
					$watermarkNew = $watermark;
				}
				
				//Position ermitteln
				$watermarkPosX = ($newimgW - $watermarkNewW) / 2;
				$watermarkPosY = ($newimgH - $watermarkNewH) / 2; 
				
				//Wasserzeichen im Orginalbild einfügen
				if(imagecopy($newimg, $watermarkNew, $watermarkPosX, $watermarkPosY, 0, 0, $watermarkNewW, $watermarkNewH)) {
					
					// imagedestroy($watermark);
					// imagedestroy($watermarkNew);
					
					//Bild mit Wasserzeichen in Objekt speichern
					$this->img = $newimg;
				
					return true;
				}
				else return false;
			}
			else return false;
		}

		// Schneidet ein Bild neu zu
		/* Werte f�r cut (X stellt das Ergebnis dar)
 
              $srcX
              +---+--------------+
        $srcY |   |              |
              +---+---+          |
              |   | X | $newY    | Ursprungsbild
              |   +---+          |
              |    $newX         |
              |                  |
              +------------------+
        */
        function cut($newX,$newY,$srcX = 0,$srcY = 0)
        {
 
                if ($this->img) {
 
                        $X = imagesx($this->img);
                        $Y = imagesy($this->img);
 
                        $newX = $this->_convert($newX,$X);
                        $newY = $this->_convert($newY,$Y);
 
                        if (!$newX) {
                                $newX = $X;
                        }
 
                        if (!$newY) {
                                $newY = $Y;
                        }
 
                        if ( ! $newimg = imagecreatetruecolor($X,$Y)) {
                                $newimg = imagecreate($X,$Y);
                        }
                        imagecopy ($newimg,$this->img,0, 0, 0, 0,$X,$Y);
                        imagedestroy ($this->img);
                        if ( ! $this->img = imagecreatetruecolor($newX, $newY)) {
                                $this->img = imagecreate($newX, $newY);
                        }
                        imagecopy ($this->img,$newimg, 0, 0,$srcX, $srcY, $newX, $newY);
                        imagedestroy($newimg);
 
                        return true;
 
                } else {
                        return false;
                }
        }
 
        /* schneidet ein Teil mit Gr��e newX und newY an festgelegten Stellen des Bildes zu
        $pos = Position welches Teil verwendet werden soll
        +---+---+---+
        | 1 | 2 | 3 |
        +---+---+---+
        | 4 | 5 | 6 |
        +---+---+---+
        | 7 | 8 | 9 |
        +---+---+---+
        */
        function autocut($newX,$newY,$pos = 5)
        {
                if ($this->img) {
 
                        $X = imagesx($this->img);
                        $Y = imagesy($this->img);
 
                        $newX = $this->_convert($newX,$X);
                        $newY = $this->_convert($newY,$Y);
 
                        if (!$newX) {
                                $newX = $X;
                        }
 
                        if (!$newY) {
                                $newY = $Y;
                        }
 
                        switch ($pos) {
                            case 1:
                                $srcX = 0;
                                $srcY = 0;
                        break;
 
                            case 2:
                                $srcX = round(($X / 2)-($newX/2));
                                $srcY = 0;
                        break;
 
                            case 3:
                                $srcX = imagesx($this->img) - $newX;
                                $srcY = 0;
                        break;
 
                            case 4:
                                $srcX = 0;
                                $srcY = round(($Y / 2)-($newY/2));
                        break;
 
                            case 5:
                                $srcX = round(($X / 2)-($newX/2));
                                $srcY = round(($Y / 2)-($newY/2));
                        break;
 
                            case 6:
                                $srcX = $X-$newX;
                                $srcY = round(($Y / 2)-($newY/2));
                        break;
 
                            case 7:
                                $srcX = 0;
                                $srcY = $Y - $newY;
                        break;
 
                            case 8:
                                $srcX = round(($X / 2)-($newX/2));
                                $srcY = $Y-$newY;
                        break;
 
                            case 9:
                                $srcX = $X- $newX;
                                $srcY = $Y - $newY;
                        break;
 
                            default:
                                $srcX = round(($X / 2)-($newX/2));
                                $srcY = round(($Y / 2)-($newY/2));
                        }
 
                        return $this->cut($newX,$newY,$srcX,$srcY);
                } else {
                        return false;
                }
        }
 
        // erzeugt ein Quadrat des Bildes mit Kantenl�nge von $size
        // ist das Bild nicht quadratisch kann mit $pos
        // der Bildausschnitt festgelegt werden, Werte siehe function autocut
        function cube($size,$pos = 5)
        {
                if ($this->img) {
 
                        $X = imagesx($this->img);
                        $Y = imagesy($this->img);
 
                        if ($X > $Y)
                        {
                                $newX = false;
                                $newY = $size;
                        } elseif ($X < $Y) {
                                $newX = $size;
                                $newY = false;
                        } else {
                                $newX = $size;
                                $newY = $size;
                        }
 
                        if ($this->resize($newX,$newY)) {
                                return $this->autocut($size,$size,$pos);
                        } else {
                                return false;
                        }
                } else {
                        return false;
                }
        }
 
        // erzeugt ein Bild dessen gr��te Kantenl�nge $size ist
        function maxSize($size)
        {
                if ($this->img) {
 
                        $X = imagesx($this->img);
                        $Y = imagesy($this->img);
 
                        if ($X > $Y)
                        {
                                $newX = $size;
                                $newY = false;
                        } elseif ($X < $Y) {
                                $newX = false;
                                $newY = $size;
                        } else {
                                $newX = $size;
                                $newY = $size;
                        }
                        return $this->resize($newX,$newY);
                } else {
                        return false;
                }
        }
 
        // erzeugt ein Bild dessen kleinste Kantenl�nge $size ist
        function minSize($size)
        {
                if ($this->img) {
 
                        $X = imagesx($this->img);
                        $Y = imagesy($this->img);
 
                        if ($X > $Y)
                        {
                                $newX = false;
                                $newY = $size;
                        } elseif ($X < $Y) {
                                $newX = $size;
                                $newY = false;
                        } else {
                                $newX = $size;
                                $newY = $size;
                        }
                        return $this->resize($newX,$newY);
                } else {
                        return false;
                }
        }
 
        // speichert das Bild als $fileName
        // wird $filename angegeben muss es ein voller Dateiname mit Pfad sein
        // ist $override wahr wird ein bestehendes Bild �berschrieben, sonst nicht
        // R�ckgabe:
        //              true wenn geschrieben (oder �berschrieben)
        //              false on error
        //              0 wenn schon existiert (nur bei $override=false)
        function save($fileName, $override = true)
        {
                if ($this->img) {
                        if (!file_exists($fileName) || $override)  {
                                if (imagejpeg($this->img,$fileName,$this->quality)) {
                                        return true;
                                } else {
                                        return false;
                                }
                        } else {
                                return 0;
                        }
                } else {
                        return false;
                }
        }
 
        // Gibt Bild an Browser aus (Ausgabe des Headers, Destroy aufrufen), beide optional
        function output($sendHeader = true,$destroy = true)
        {
                if ($this->img) {
 
                                if ($sendHeader) {
                                        header("Content-type: image/jpeg");
                                }
 
                                imagejpeg($this->img,"",$this->quality);
 
                                if ($destroy) {
                                        $this->destroy();
                                }
 
                } else {
                        return false;
                }
        }
 
        // Setzt die Werte in der Klasse frei und l�scht Bild
        function destroy()
        {
                if ($this->img) {
                        imagedestroy($this->img);
                }
                $this->img = false;
                $this->fileInfo = false;
                $this->fullName = false;
                $this->newX = false;
                $this->newY = false;
                $this->quality = 70;
                $this->orgX = false;
                $this->orgY = false;
        }
 
        // rechnet prozentuale Angaben in Pixel um, erwartet
        // ist $value eine Prozentangabe z.B. (string) "50%" wird diese umgerechnet
        // $full muss als 100% in Pixel angegeben werden
        function _convert($value,$full = false)
        {
                if (strstr($value,"%")) {
                        $value = trim(str_replace ("%", "", $value));
                        $value = ($full / 100) * $value;
                }
                if ($value < 1 && $value !== false) {
                        $value = 1;
                }
                return $value;
        }
 
}
?>