/// @desc (Aftermath)				
// Only Work, if (Full_View) is no longer needed

// Tekrardan Ayarların Uygula ve Duruma göre (Eski) Haline Geri "DÖN"
global._v_multply = (k_VIEW_MULTPLY_def);
switch (k_PIXEL_PERFECT_def) {
	case true:	// (global._v_multply) Değeri, (Pixel-Perfect) olabilmesi için sadece (Çift - 1 - 0.5) Olabilir
		if ((global._v_multply % 2) == 0 || global._v_multply == 1 || global._v_multply == 0.5) {		
			_v_W_Edit = _v_W * global._v_multply;			// (Dont Touch) || Kamera Yüksekliği (Width)  || (İşlemler Bu Değişken Üstünden Yapılacak)
			_v_H_Edit = _v_H * global._v_multply;			// (Dont Touch) || Kamera Genişliği  (Height) || (İşlemler Bu Değişken Üstünden Yapılacak)
		} else {
			global._v_multply = 2;							// "NECESSARY" (Default)
			_v_W_Edit		  = _v_W * global._v_multply;	// "NECESSARY" (Default) || Kamera Yüksekliği (Width)  
			_v_H_Edit		  = _v_H * global._v_multply;	// "NECESSARY" (Default) || Kamera Genişliği  (Height) 
		}
	break;
	case false:	// Eğer (Pixel-Perfect) "DEĞİL" ise, İstenilen Verileri (Default) Korumasız Koy
		_v_W_Edit = _v_W * global._v_multply;				// (Dont Touch) || Kamera Yüksekliği (Width)  || (İşlemler Bu Değişken Üstünden Yapılacak)
		_v_H_Edit = _v_H * global._v_multply;				// (Dont Touch) || Kamera Genişliği  (Height) || (İşlemler Bu Değişken Üstünden Yapılacak)
	break;
}
show_debug_message("-(Special) Room is Over, Converting (View) Setting's to (Normal)");