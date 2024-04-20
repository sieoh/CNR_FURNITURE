<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includes/header.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        	<form action="workerInsert" method="get" id="searchForm" class="col-md-12" >
	          <div class="col-sm-12" >
	          	<a href="workerInsert" style="color: black;">
		          	<ol class="breadcrumb float-sm-left">
		          		<h1 class="m-0"><i class="far fa-clipboard"></i>작업자</h1>
		          	</ol>
	          	</a>
	            <ol class="breadcrumb float-sm-right">
		            <div class="reset">
			        		<img class="resetPng" alt="reset" src="/resources/img/reset.png" >
			        	</div>
	              <div class="col-sm-1 ml-auto" style="margin-left: 10px;">
	              	<button type="submit" class="btn btn-primary search-btn"
	                id="" onClick="javascript: search();"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
	            	</div>
	            </ol>
	          </div><!-- /.col -->
	          <br>
          	<!-- 검색창 1줄 -->
             <div class="searchBar">
               <div class="col-sm-1 sb-name">제조<br>LOT번호</div>
	             <div class="col-sm-2 sb-text">
                 <input type="text" list="workInstructuionList" class="col-sm-12 input-text" id="find_work_instruction" name="find_work_instruction">
	                <datalist id="workInstructuionList">
                     <c:forEach items="${instructionList}" var="instruction">
                         <option value="${instruction.insLotId}">생산제품번호: ${instruction.insItemId}</option>
                     </c:forEach>
                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">공정번호</div>
               <div class="col-sm-2 sb-text">
               		<input type="text" list="workProcessInfoList" class="col-sm-12 input-text" id="find_work_processInfo" name="find_work_processInfo">
	                <datalist id="workProcessInfoList">
                     <c:forEach items="${processInfoList}" var="processInfo">
                         <option value="${processInfo.pi_id}">공정명: ${processInfo.pi_name} | ${processInfo.mi_name}(${processInfo.pi_machine_id}, 위치:${processInfo.position}) </option>
                     </c:forEach>
                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">설비번호</div>
	             <div class="col-sm-2 sb-text">
                 <input type="text" list="workMachineInfoList" class="col-sm-12 input-text" id="find_work_machine" name="find_work_machine">
	                <datalist id="workMachineInfoList">
                     <c:forEach items="${machineInfoList}" var="machineList">
                         <option value="${machineList.mi_id}">${machineList.mi_name}(${machineList.position}) </option>
                     </c:forEach>
                 </datalist>
               </div>
             </div>
             <!-- 검색창 2줄 -->
             <div class="searchBar" style="margin-top: -12px;">
               <div class="col-sm-1 sb-name">작업번호</div>
               <div class="col-sm-2 sb-text">
                 <input type="text" list="workList" class="col-sm-12 input-text" id="find_work_id" name="find_work_id">
	                <datalist id="workList">
                     <c:forEach items="${workList}" var="workList">
                         <option value="${workList.w_id}">로트번호:${workList.w_lot_id}(공정번호:${workList.w_pi_id})</option>
                     </c:forEach>
                 </datalist>
               </div>
               <div class="col-sm-1 sb-name">조회일자</div>
               <div class="col-sm-4 sb-text" style="margin-left: 8px;">
                 <input type="date" class="col-sm-6 input-text"  id="workStartDate" name="workStartDate"
                   value='' autocomplete="off" style="margin-right: 4px;"/>
                   ~
                 <input type="date" class="col-sm-6 input-text"  id="workEndDate" name="workEndDate"
                   value='' autocomplete="off" style="margin-left: 4px;"/>
               </div>
             </div>
           </form>
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
				<!-- 작업자배치 Table -->
	        <div class="titleAndTable" id="selectWorkerInsertTable" style="max-height:800px;" >
	           <div class="workTableTitle">
	              <div class="icon"><i class="fa fa-list"></i></div>
	              <div class="workTableName">작업자배치</div>
	            </div>
	          <div class="workTable">
	            <table cellpadding="0" cellspacing="0" border="0">
	              <thead class="work-tbl-header">
	                <tr>
	                  <th>No</th>
	                  <th>작업번호</th>
	                  <th>작업시작시간</th>
	                  <th>작업종료시간</th>
	                  <th>제조LOT번호</th>
	                  <th>공정번호</th>
	                  <th>공정명</th>
	                  <th>설비번호</th>
	                  <th>설비명</th>
	                  <th>작업위치</th>
	                  <th>작업자</th>
	                  <th>작업자등록</th>
	                </tr>
	              </thead>
	              <tbody class="work-tbl-content">
	              	<c:forEach items="${workerInsertList}" var="workerInsertList">
		                <tr>
		                  <td>${workerInsertList.rn}</td>
		                  <td>${workerInsertList.w_id}</td>
		                  <td>${workerInsertList.w_start_time}</td>
		                  <td>${workerInsertList.w_end_time}</td>
		                  <td>${workerInsertList.w_lot_id}</td>
		                  <td>${workerInsertList.w_pi_id}</td>
		                  <td>${workerInsertList.pi_name}</td>
		                  <td>${workerInsertList.pi_machine_id}</td>
		                  <td>${workerInsertList.mi_name}</td>
		                  <td>${workerInsertList.position}</td>
		                  <c:if test="${!empty workerInsertList.substrallemp}">
			                  <td title="${workerInsertList.allemplist}">
													    ${workerInsertList.substrallemp}
												</td>
											</c:if>
											<c:if test="${empty workerInsertList.substrallemp}">
			                  <td>${workerInsertList.substrallemp}</td>
											</c:if>
		                  <td>
			                  <button class="workerInsertBtn" id="workerInsertTd" data-toggle="modal" data-target="#workerInsertModal"
				                  data-work-id="${workerInsertList.w_id}" data-lot-id="${workerInsertList.w_lot_id}" 
				                  data-pi-id="${workerInsertList.w_pi_id}" data-mi-id="${workerInsertList.pi_machine_id}" 
					                data-start-time="${workerInsertList.w_start_time}" data-end-time="${workerInsertList.w_end_time}">등록</button>
			                </td>
		                </tr>
		              </c:forEach>
	              </tbody>
	            </table><!-- /.table -->
	        	</div><!-- /.workTable -->
	       	</div><!-- /.titleAndTable -->
	       	
       		
     	</div><!-- /.row -->
   	</div><!-- /.container-fluid -->
 	</div><!-- /.content -->
 </div><!-- /.content-wrapper -->        
        
<!-- 작업자등록 모달 -->
<div class="modal fade" id="workerInsertModal" aria-labelledby="#workerInsertModalLabel" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog todayWorkInsert-Modal-Dialog" role="document" style="min-width: 60%;">
    <div class="modal-content">
      <div class="modal-header">
        <div class="workerInsertModalTitle" id="workerInsertModalLabel" style="font-size: 150%; font-weight:800;">작업자등록</div>
      </div>
      <!-- modal-body -->
      <div class="modal-body work-modal-body">
      	<form action="/workerInsertModalForm" id="workerInsertModalForm" name="workerInsertModalForm" class="col-md-12" >
		      <!-- 등록행 1 -->
		      <div class="work-modal-board">
		      	<!-- 작업번호 -->
		        <div class="col-sm-2 work-modal-name">작업번호</div>
		        <div class="col-sm-2 work-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="w_id" name="w_id"
		            value='<c:out value="${data.w_id}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.작업번호 -->
		      	<div class="col-sm-8 emptyModal"></div>
		      </div><!-- /.등록행 1 -->
		      <!-- 등록행 2 -->
		      <div class="work-modal-board">
		      	<!-- 제조LOT번호 -->
		        <div class="col-sm-2 work-modal-name">제조LOT번호</div>
		        <div class="col-sm-2 work-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="w_lot_id" name="w_lot_id"
	            	value='<c:out value="${data.w_lot_id}"/>' autocomplete="off" readonly="readonly"/>
		        </div><!-- /.제조LOT번호 -->
		        <!-- 공정번호 -->
		        <div class="col-sm-2 work-modal-name">공정번호</div>
		        <div class="col-sm-2 work-modal-text">
		        	<input type="number" class="col-sm-12 modal-input" id="w_pi_id" name="w_pi_id" 
		          	value='<c:out value="${data.w_pi_id}" />' readonly="readonly"/>
		        </div><!-- /.공정번호 -->
			      <!-- 설비번호 -->
		        <div class="col-sm-2 work-modal-name">설비번호</div>
		        <div class="col-sm-2 work-modal-text">
		          <input type="text" class="col-sm-12 modal-input" id="pi_machine_id" name="pi_machine_id" 
		          value='<c:out value="${data.pi_machine_id}" />' readonly="readonly" />
		        </div><!-- /.설비번호 -->
		      </div><!-- /.등록행 2 -->
		       <!-- 등록행 3 -->
		      <div class="work-modal-board">
			      <!-- 작업시작시간 -->
		        <div class="col-sm-2 work-modal-name">작업시작시간</div>
		        <div class="col-sm-4 work-modal-text">
		          <input type="datetime-local" class="col-sm-12 modal-input" id="w_start_time" name="w_start_time" 
		          value='<c:out value="${data.w_start_time}" />' readonly="readonly" />
		        </div><!-- /.작업시작시간 -->
		        <!-- 작업종료시간 -->
		        <div class="col-sm-2 work-modal-name">작업종료시간</div>
		        <div class="col-sm-4 work-modal-text">
		          <input type="datetime-local" class="col-sm-12 modal-input" id="w_end_time" name="w_end_time" 
		          	value='<c:out value="${data.w_end_time}" />' readonly="readonly"/>
		        </div><!-- /.작업종료시간 -->
		      </div><!-- /.등록행 3 -->
		      
	        <!-- 구분선 -->
      		<div class="divBorderWorkerInsertModal"></div>
      		
      		
      		<!-- 검색행 1 -->
		      <div class="work-modal-board">
		      	<!-- 부서명 -->
		        <div class="col-sm-2 work-modal-name">부서명</div>
		        <div class="col-sm-3 work-modal-text">
		        	<select class="col-sm-12 modal-input" id="find_dp_name" name="find_dp_name">
		        		<c:forEach items="${dpNameList}" var="dpNameList">
		        			<option value='<c:out value="${dpNameList.e_dp_name}"/>'>${dpNameList.e_dp_name}</option>
								</c:forEach>		        	
							</select>
		        </div><!-- /.부서명 -->
		      	<!-- 사원번호 -->
		        <div class="col-sm-2 work-modal-name">사원번호</div>
		        <div class="col-sm-3 work-modal-text">
		        	<input type="text" class="col-sm-12 modal-input" id="find_emp_id" name="find_emp_id"
	            	value='<c:out value="${data.itemNameModal}"/>' autocomplete="off"/>
		        </div><!-- /.사원번호 -->
		        <!-- 검색버튼 -->
		        <div class="col-sm-2 work-modal-text">
		        	<button type="submit" class="btn btn-primary search-btn"
	                id="" onClick="javascript: search();"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
		        </div>
		      </div><!-- /.등록행 1 -->
		      <div class="row workerInsert-modal-table">
		       <!-- 사원목록 Table -->
	         <div class="col-sm-6">
			        <div class="titleAndTable">
			           <div class="workTableTitle">
			              <div class="icon"><i class="fa fa-list"></i></div>
			              <div class="workTableName" >사원목록</div>
			              <i class="far fa-plus-square" id="plus-square"></i>
			            </div>
			          <div class="table" style="max-height: 200px;">
			            <table cellpadding="0" cellspacing="0" border="0">
			              <thead class="tbl-header">
			                <tr>
			                  <th><input type='checkbox' name='member' value='memberSelectAll' onclick="memberSelectAll(this)"/></th>
			                  <th>부서명</th>
			                  <th>사원번호</th>
			                  <th>사원명</th>
			                  <th>직급</th>
			                </tr>
			              </thead>
			              <tbody class="tbl-content" style="height: 42px;">
			              	<c:forEach items="${empInfoList}" var="empInfoList">
				                <tr>
				                  <td><input type='checkbox' name='member' value='사원번호'/></td>
				                  <td>${empInfoList.e_dp_name }</td>
				                  <td>${empInfoList.e_id }</td>
				                  <td>${empInfoList.e_name }</td>
				                  <td>${empInfoList.e_role }</td>
				                </tr>
			                </c:forEach>
			              </tbody>
			            </table><!-- /.table -->
		          	</div><!-- /.workTable -->
		        	</div><!-- /.titleAndTable -->
	        	</div><!-- /. 사원목록 col-sm-6 -->
	         <div class="col-sm-6" >
			        <div class="titleAndTable">
			           <div class="workTableTitle">
			              <div class="icon"><i class="fa fa-list"></i></div>
			              <div class="workTableName" >작업자목록</div>
			              <i class="fa-regular fa-square-minus" id="minus-spuare"></i>
			            </div>
			          <div class="table" style="max-height: 200px;">
			            <table cellpadding="0" cellspacing="0" border="0">
			              <thead class="tbl-header">
			                <tr>
			                  <th><input type='checkbox' name='worker' value='workerSelectAll' onclick="workerSelectAll(this)"/></th>
			                  <th>부서명</th>
			                  <th>사원번호</th>
			                  <th>사원명</th>
			                </tr>
			              </thead>
			              <tbody class="tbl-content" style="height: 42px;">
			                <tr>
			                  <td><input type='checkbox' name='worker' value='사원번호'/></td>
			                  <td>생산1팀</td>
			                  <td>10000001</td>
			                  <td>ㅇㅇㅇ</td>
			                </tr>
			              </tbody>
			            </table><!-- /.table -->
		          	</div><!-- /.workTable -->
		        	</div><!-- /.titleAndTable -->
	        	</div><!-- /. 작업자목록 col-sm-6 -->
        	</div><!-- /. row -->
        	
      
      	<!-- 구분선 -->
      	<div class=divBorderModal></div>
      
      
      	<div class="modal-footer">
           <button type="button" class="btn btn-primary">등록</button>
           <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	      </div><!-- /.modal-body -->
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</div>
  
<script type="text/javascript">
//검색창
function search() {
 	// 검색 로직 실행
	document.getElementById('searchForm').submit();
}
// 작업자 등록의 사원목록 체크박스 전체 선택
function memberSelectAll(memberSelectAll)  {
  const memberCheckboxes 
       = document.getElementsByName('member');
  
  memberCheckboxes.forEach((memberCheckbox) => {
    memberCheckbox.checked = memberSelectAll.checked;
  })
}
// 작업자 등록의 작업자목록 체크박스 전체 선택
function workerSelectAll(workerSelectAll)  {
  const workerCheckboxes 
       = document.getElementsByName('worker');
  
  workerCheckboxes.forEach((workerCheckbox) => {
    workerCheckbox.checked = workerSelectAll.checked;
  })
}
	
</script>
<script defer src="/resources/js/work.js"></script>
<%@ include file="../includes/footer.jsp" %>
