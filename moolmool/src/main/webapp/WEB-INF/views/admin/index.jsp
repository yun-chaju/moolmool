<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	<div class="admin-menu"> 
		<ul class="nav nav-pills nav-stacked menu-option">
			<li role="presentation" class="active">
				<a href="${pageContext.request.contextPath }/admin"><i class="material-icons menu-icon">dvr</i>&nbsp;&nbsp;&nbsp;<span>Dashboard</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/members"><i class="material-icons menu-icon">people</i>&nbsp;&nbsp;&nbsp;<span>회원관리</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/boards"><i class="material-icons menu-icon">sms</i>&nbsp;&nbsp;&nbsp;<span>커뮤니티 관리</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/ftype"><i class="material-icons menu-icon">queue</i>&nbsp;&nbsp;&nbsp;<span>FAQ TYPE 관리</span></a>
			</li>
			<li role="presentation">
				<a href="${pageContext.request.contextPath }/admin/email"><i class="material-icons menu-icon">email</i>&nbsp;&nbsp;&nbsp;<span>메일링 시스템</span></a>
			</li>
		</ul>
	</div>
	<div class="admin-content">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<span class="member-count">회원 수</span>
					</div>
					<div class="panel-body text-center">
						<i class="material-icons count-icon member-count">sentiment_satisfied</i>
						<span class="member-count">${ totalMember }</span>
					</div>		
				</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<span class="trade-stay">대기중인 거래</span>
					</div>
					<div class="panel-body text-center">
						<i class="material-icons count-icon trade-stay">pan_tool</i>
						<span class="trade-stay">${ totalStay }</span><br>
					</div>						
				</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-success">
					<div class="panel-heading">
						<span class="trade-ing">현재 진행중인 거래</span>
					</div>
					<div class="panel-body text-center" >
						<i class="material-icons count-icon trade-ing">transfer_within_a_station</i>
						<span class="trade-ing">${ totalProcessing }</span>
						
					</div>		
				</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<span class="trade-complete">거래 완료</span>
					</div>
					<div class="panel-body text-center">
						<i class="material-icons count-icon trade-complete">check_circle</i>
						<span class="trade-complete">${ totalComplete }</span>
					</div>		
				</div>
			</div>
		</div>
	</div>
</section>