package com.mellow.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
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
	public cosmeticinfoVO(String barcode, String cos_name, String cos_type, String using_date, String brand_name,
			String cos_dosage, String cos_effect, String cos_spf, String cos_pa) {
		super();
		this.barcode = barcode;
		this.cos_name = cos_name;
		this.cos_type = cos_type;
		this.using_date = using_date;
		this.brand_name = brand_name;
		this.cos_dosage = cos_dosage;
		this.cos_effect = cos_effect;
		this.cos_spf = cos_spf;
		this.cos_pa = cos_pa;
	}
	
	
	
	
	

}
