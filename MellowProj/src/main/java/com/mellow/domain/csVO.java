package com.mellow.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class csVO {
   
   // 고객센터 테이블 vo
   // 질의 순번
   private int q_seq;
   
   // 질의 제목
   private String q_subject;
   
   // 질의 내용
   private String q_content;
   
   // 질의 날짜 - date
   private String q_date;
   
   // 질의 파일
   private String q_file;
   
   // 질의 작성자
   private String user_id;
   

}