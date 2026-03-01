with(oBullet){
	instance_destroy();
	with (other)
	{hp -= 1;
	 if (hp < 1)
	 {instance_destroy();
	 }
	}
	
}