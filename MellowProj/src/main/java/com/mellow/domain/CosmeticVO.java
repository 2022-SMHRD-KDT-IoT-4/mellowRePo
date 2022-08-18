package com.mellow.domain;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CosmeticVO {
   
   private String req_seq;
   private String barcode;
   private String cos_name;
   private String cos_type;
   private String exp_date;
   private String using_date;
   private String open_yn;
   private String open_date;
   private String discard_date;
   private String user_id;
   private String cos_file;
   private String listType;
   private String cos_effect;
}