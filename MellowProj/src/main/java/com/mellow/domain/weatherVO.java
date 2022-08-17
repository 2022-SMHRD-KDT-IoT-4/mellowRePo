package com.mellow.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class weatherVO {
	private int sunData;
	private float tmx;
	private float rainPerc;
	
}
