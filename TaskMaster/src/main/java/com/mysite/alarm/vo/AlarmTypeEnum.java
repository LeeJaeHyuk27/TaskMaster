package com.mysite.alarm.vo;

public enum AlarmTypeEnum {

    COM_APPROVAL("A"),      // 회사 승인
	PROJ_INVITATION("B"),   // 프로젝트 초대
	TASK_ALLOCATOIN("C"),   // 업무 할당
	REPLY("D"),             // 댓글
	RE_REPLY("E");          // 대댓글

	private String val;

	AlarmTypeEnum(String val) {
		this.val = val;
	}

	public String getVal() {
		return val;
	}
}
