/*
 * @(#)ProcessDef.java
 * 
 * Copyright @ 2001-2012 SANY Group Co.,Ltd.
 * All right reserved.
 * 
 * 这个软件是属于三一集团有限公司机密的和私有信息，不得泄露。
 * 并且只能由三一集团有限公司内部员工在得到许可的情况下才允许使用。
 * This software is the confidential and proprietary information
 * of SANY Group Co, Ltd. You shall not disclose such
 * Confidential Information and shall use it only in accordance
 * with the terms of the license agreement you entered into with
 * SANY Group Co, Ltd.
 */
package com.sany.workflow.entity;

import java.util.Date;


/**
 * 对应activiti中的流程定义表中的数据
 * @author yinbp
 * @since 2012-3-22 下午6:06:29
 */
public class ProcessDef {
	
	
	private int REV_;
	private int HAS_START_FORM_KEY_;
	private int SUSPENSION_STATE_;
	private String DEPLOYMENT_ID_;
	private String ID_;
	// Method descriptor #4 ()Ljava/lang/String;
	private java.lang.String CATEGORY_;

	// Method descriptor #4 ()Ljava/lang/String;
	private java.lang.String NAME_;

	// Method descriptor #4 ()Ljava/lang/String;
	private java.lang.String KEY_;

	// Method descriptor #9 ()I
	private int VERSION_;

	// Method descriptor #4 ()Ljava/lang/String;
	private java.lang.String RESOURCE_NAME_;

	// Method descriptor #4 ()Ljava/lang/String;
	private java.lang.String DGRM_RESOURCE_NAME_;
	
	private String DEPLOYMENT_NAME_;
	
	private Date DEPLOYMENT_TIME_;
	
	private String DEPLOYMENT_TIME_STRING_;
	
	private String business_name;
	
	public int getREV_() {
		return REV_;
	}

	public void setREV_(int rEV_) {
		REV_ = rEV_;
	}

	public int getHAS_START_FORM_KEY_() {
		return HAS_START_FORM_KEY_;
	}

	public void setHAS_START_FORM_KEY_(int hAS_START_FORM_KEY_) {
		HAS_START_FORM_KEY_ = hAS_START_FORM_KEY_;
	}

	public int getSUSPENSION_STATE_() {
		return SUSPENSION_STATE_;
	}

	public void setSUSPENSION_STATE_(int sUSPENSION_STATE_) {
		SUSPENSION_STATE_ = sUSPENSION_STATE_;
	}

	public String getDEPLOYMENT_ID_() {
		return DEPLOYMENT_ID_;
	}

	public void setDEPLOYMENT_ID_(String dEPLOYMENT_ID_) {
		DEPLOYMENT_ID_ = dEPLOYMENT_ID_;
	}

	public String getID_() {
		return ID_;
	}

	public void setID_(String iD_) {
		ID_ = iD_;
	}

	public java.lang.String getCATEGORY_() {
		return CATEGORY_;
	}

	public void setCATEGORY_(java.lang.String cATEGORY_) {
		CATEGORY_ = cATEGORY_;
	}

	public java.lang.String getNAME_() {
		return NAME_;
	}

	public void setNAME_(java.lang.String nAME_) {
		NAME_ = nAME_;
	}

	public java.lang.String getKEY_() {
		return KEY_;
	}

	public void setKEY_(java.lang.String kEY_) {
		KEY_ = kEY_;
	}

	public int getVERSION_() {
		return VERSION_;
	}

	public void setVERSION_(int vERSION_) {
		VERSION_ = vERSION_;
	}

	public java.lang.String getRESOURCE_NAME_() {
		return RESOURCE_NAME_;
	}

	public void setRESOURCE_NAME_(java.lang.String rESOURCE_NAME_) {
		RESOURCE_NAME_ = rESOURCE_NAME_;
	}

	public java.lang.String getDGRM_RESOURCE_NAME_() {
		return DGRM_RESOURCE_NAME_;
	}

	public void setDGRM_RESOURCE_NAME_(java.lang.String dGRM_RESOURCE_NAME_) {
		DGRM_RESOURCE_NAME_ = dGRM_RESOURCE_NAME_;
	}

	public String getDEPLOYMENT_NAME_() {
		return DEPLOYMENT_NAME_;
	}

	public void setDEPLOYMENT_NAME_(String dEPLOYMENT_NAME_) {
		DEPLOYMENT_NAME_ = dEPLOYMENT_NAME_;
	}

	public Date getDEPLOYMENT_TIME_() {
		return DEPLOYMENT_TIME_;
	}

	public void setDEPLOYMENT_TIME_(Date dEPLOYMENT_TIME_) {
		DEPLOYMENT_TIME_ = dEPLOYMENT_TIME_;
	}

	public String getDEPLOYMENT_TIME_STRING_() {
		return DEPLOYMENT_TIME_STRING_;
	}

	public void setDEPLOYMENT_TIME_STRING_(String dEPLOYMENT_TIME_STRING_) {
		DEPLOYMENT_TIME_STRING_ = dEPLOYMENT_TIME_STRING_;
	}

	public String getBusiness_name() {
		return business_name;
	}

	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}


	

	
	

}
