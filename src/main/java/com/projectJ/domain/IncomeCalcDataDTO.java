package com.projectJ.domain;

import lombok.Data;

@Data
public class IncomeCalcDataDTO {

	private String i_type;			// 업종분야(치킨.피자.주점.커피)
	private int i_payRatio;			// 원가 율
	private int i_workPayMonth;		// 인건비 율
	private int i_monthlyRent;		// 임대료 율
	private int i_etcPay;			// 관리비 율
	private int i_salesFee;			// 판매수수료 율
	private int resultSalesSize;	// 1평당 월매출 
	
}
