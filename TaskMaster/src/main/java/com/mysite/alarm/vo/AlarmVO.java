package com.mysite.alarm.vo;

public class AlarmVO {

    private Integer alarmSeq;
	private Integer projectSeq;
	private Integer taskSeq;
	private String userId;
	private String createUserId;
	private String alarmContents;
	private String alarmType;
	private String readYn;
	private String regDate;

    public Integer getAlarmSeq() {
		return alarmSeq;
	}
	public void setAlarmSeq(Integer alarmSeq) {
		this.alarmSeq = alarmSeq;
	}

    public Integer getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(Integer projectSeq) {
		this.projectSeq = projectSeq;
	}

    public Integer getTaskSeq() {
		return taskSeq;
	}
	public void setTaskSeq(Integer taskSeq) {
		this.taskSeq = taskSeq;
	}

    public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

    public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

    public String getAlarmContents() {
		return alarmContents;
	}
	public void setAlarmContents(String alarmContents) {
		this.alarmContents = alarmContents;
	}

    public String getAlarmType() {
		return alarmType;
	}
	public void setAlarmType(String alarmType) {
		this.alarmType = alarmType;
	}

    public String getReadYn() {
		return readYn;
	}
	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}

    public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
