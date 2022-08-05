package com.mellow.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class cosmeticinfoVO {
	public String barcode;
	public String cos_name; //제품명
	public String cos_type; // 종류
	public String using_date; // 사용기한
	public String brand_name; //브랜드명
	public String cos_dosage; //용법.용량
	public String cos_effect; // 효능효과
	public String cos_spf; // 자외선(SPF)
	public String cos_pa; // 자외선(PA)
	
}
