package com.mellow.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class cosmeticinfoVO {
	@NonNull public String barcode;
	@NonNull public String cos_name; //제품명
	@NonNull public String cos_type; // 종류
	@NonNull public String using_date; // 사용기한
	@NonNull public String brand_name; //브랜드명
	@NonNull public String cos_dosage; //용법.용량
	@NonNull public String cos_effect; // 효능효과
	@NonNull public String cos_spf; // 자외선(SPF)
	@NonNull public String cos_pa; // 자외선(PA)
	@NonNull public String cos_file;
}
