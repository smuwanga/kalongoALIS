<?php

class Mypdf extends TCPDF {
	//Pdf Header
	Public function Header(){
		if($this->page == 1){
			$this->writeHTML(View::make('reportHeader'), true, false, true, false, '');
			$this->SetMargins(PDF_MARGIN_LEFT, 40, PDF_MARGIN_RIGHT);

		}

	}

	Public function Footer(){
		//Position at 15mm at the bottom
		$this->SetY(-15);
		//Set font
		$this->SetFont('helvetica', 'I', 8);
		//set page number
		$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'R', 0, '', 0, false, 'T', 'M');


	}
}