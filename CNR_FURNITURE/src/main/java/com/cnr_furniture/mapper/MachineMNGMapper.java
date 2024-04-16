package com.cnr_furniture.mapper;

import com.cnr_furniture.domain.Machine.*;

import java.util.List;

public interface MachineMNGMapper {
    // 설비 체크리스트 정보 리스트
    List<MachineCheckVO> getMachineCheckList(SearchMachineCheckVO searchMachineCheckVO);

    // 설비 유형 가져오기
    List<MachineCheckVO> getMachineCheckType();

    // 점검 방법 가져오기
    List<MachineCheckVO> getMachineCheckMethod();

    // 체크리스트 추가
    int addMachineCheck(MachineCheckVO machineCheckVO);

    // 마지막 체크리스트 보여주기
    MachineCheckVO getMachineCheckOne();

    // 설비명 ID 가져오기
    List<MachineVO> getMachineInfo();

    // 체크리스트 가져오기
    List<MachineCheckVO> getMachineCheckAll(SearchMachineVO searchMachineVO);

    // 체크리스트 기록 추가
    int insertMachineCheckRecord(MachineCheckRecordVO machineCheckRecordVO);

    // 설비 작동 테이블에서 설비 상태 업데이트
    int updateMachineCondition(MachineWorkVO machineWorkVO);

    // 설비 수리 이력관리 리스트 가져오기
    List<MachineRepairVO> McRepairList(SearchMachineVO searchMachineVO);
}
