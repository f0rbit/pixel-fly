/// @desc (Optimize)
// Use (Optimize) Mode if your project is made no unchecked (Object_Existence)
// Ayrıca (Önemli) objelerinizi (_target) kısmına ne girdiyseniz onu daima "TAKİP" edecek şekilde düzenleyin, böylelikle sistemleriniz (0.0) dan uzaklaşsanız bile çalışacaktır

// (DE-Activate) All of the Object's that are Outside of The "VIEW" Region
if (_target != noone && instance_exists(_target) && _optimize)
	{instance_deactivate_all(true);}

// (Loop) || (Don't Touch)
alarm[2] = (_game_sp / _delay);