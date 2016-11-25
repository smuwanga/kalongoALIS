@section("sidebar")

<nav id="side_nav">
			<ul>

				<li>
					<a href="{{ URL::route('user.home')}}"><span class="ion-speedometer"></span> <span class="nav_title">Dashboard</span></a>
				</li>
				<li>
					<a href="{{ URL::route('patient.index')}}">
					<span class="ion-person"></span> <span class="nav_title">Patient Information</span></a>
				</li>
				<li>
					<a href="{{ URL::route('test.index')}}">
					<span class="ion-erlenmeyer-flask"></span> <span class="nav_title">RRT</span></a>
				</li>


				<li class="nav_trigger">
					<a href="#">
					<span class="ion-ios-cart"></span>
						<span class="nav_title">ELS</span>
					</a>
					<div class="sub_panel" style="left: -220px;">
						<div class="side_inner ps-ready ps-container" style="height: 620px;">
							<h4 class="panel_heading panel_heading_first">Inventory</h4>
							<ul>
								<li>
									<a href="{{ URL::route("stockcard.index")}}">
									<span class="glyphicon glyphicon-tag"></span> {{trans('messages.stock-card')}}</a>
								</li>
							<li>
								<a href="{{ URL::route("stockrequisition.index")}}">
								<span class="glyphicon glyphicon-tag"></span> Stockbook</a>
							</li>
							<li>
								<a href="{{ URL::route("commodity.index")}}">
								<span class="glyphicon glyphicon-tag"></span> {{trans('messages.commodities')}}</a>
							</li>
							<li>
								<a href="{{ URL::route("supplier.index")}}">
								<span class="glyphicon glyphicon-tag"></span> {{Lang::choice('messages.suppliers',2)}}</a>
							</li>
							<li>
								<a href="{{ URL::route("metric.index")}}">
								<span class="glyphicon glyphicon-tag"></span> {{trans('messages.metrics')}}</a>
							</li>
							</ul>
							<h4 class="panel_heading">Equipment</h4>
							<ul>
								<li><a href="{{ URL::route("equipmentinventory.index")}}"><span class="glyphicon glyphicon-tag"></span> Inventory</a></li>
								<li><a href="{{ URL::route("equipmentmaintenance.index")}}"><span class="glyphicon glyphicon-tag"></span> Maintenance log</a></li>
								<li><a href="{{ URL::route("equipmentbreakdown.index")}}"><span class="glyphicon glyphicon-tag"></span> Breakdown</a></li>
								<li><a href="{{ URL::route("equipmentsupplier.index")}}"><span class="glyphicon glyphicon-tag"></span> Supplier</a></li>
							</ul>
						<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px; width: 215px; display: none;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px; height: 620px; display: none;"><div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div></div></div>
					</div>
				</li>


				<li class="nav_trigger">
					<a href="#">
						<span class="ion-nuclear"></span>
						<span class="nav_title">BB</span>
					</a>
					<div class="sub_panel" style="left: -220px;">
						<div class="side_inner ps-ready ps-container" style="height: 620px;">
							<h4 class="panel_heading panel_heading_first">Bio-safety / Bio-security</h4>
							<ul>
							<li>
								<a href="{{ URL::route('bbincidence.index')}}">
								<span class="glyphicon glyphicon-list"></span> Summary Log</a>
							</li>
							<li>
							<a href="{{ URL::route('bbincidence.create')}}">
								<span class="glyphicon glyphicon-plus-sign"></span> Create</a>
							</li>
							<li>
							<a href="{{ URL::route('bbincidence.bbfacilityreport')}}">
								<span class="glyphicon glyphicon-stats"></span> Facility Report</a>
							</li>

							<li>
							<a href="">---</a>
							</li>

							<li>
							<a href="{{ URL::route('bike.index')}}">
								<span class="glyphicon glyphicon-dashboard"></span> Motor Bikes</a>
							</li>
							</ul>

						<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px; width: 215px; display: none;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px; height: 620px; display: none;"><div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div></div></div>
					</div>
				</li>

				<li class="nav_trigger">
					<a href="#">
						<span class="ion-nuclear"></span>
						<span class="nav_title">EVENTS</span>
					</a>
					<div class="sub_panel" style="left: -220px;">
						<div class="side_inner ps-ready ps-container" style="height: 620px;">
							<h4 class="panel_heading panel_heading_first">Events / Activities</h4>
							<ul>
							<li>
								<a href="{{ URL::route('event.index')}}">
								<span class="glyphicon glyphicon-list"></span> Events Log</a>
							</li>
							<li>
							<a href="{{ URL::route('event.create')}}">
								<span class="glyphicon glyphicon-plus-sign"></span> Register</a>
							</li>
							<li>
								<a href="{{ URL::route('event.eventfilter')}}">
								<span class="glyphicon glyphicon-list"></span> Events Filter</a>
							</li>
							</ul>

						<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px; width: 215px; display: none;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px; height: 620px; display: none;"><div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div></div></div>
					</div>
				</li>



				<li class="nav_trigger">
					<a href="#">
						<span class="ion-key"></span>
						<span class="nav_title">Access Control</span>
					</a>
					<div class="sub_panel" style="left: -220px;">
						<div class="side_inner ps-ready ps-container" style="height: 620px;">
							<h4 class="panel_heading panel_heading_first">Access Control</h4>
							<ul>
					<li>
						<div>
							<a href="{{ (Entrust::can('manage_users')) ? URL::route('user.index') : URL::to('user/'.Auth::user()->id.'/edit') }}">
								<span class="glyphicon glyphicon-tag"></span> {{trans('messages.user-accounts')}}</a>
						</div>
					</li>
					<li>
						<div>
							<a href="{{ URL::route("permission.index")}}">
								<span class="glyphicon glyphicon-tag"></span> {{ Lang::choice('messages.permission', 2)}}</a>
						</div>
					</li>
					<li>
						<div>
							<a href="{{ URL::route("role.index")}}">
								<span class="glyphicon glyphicon-tag"></span> {{ Lang::choice('messages.role', 2)}}</a>
						</div>
					</li>
					<li>
						<div>
							<a href="{{ URL::route("role.assign")}}">
								<span class="glyphicon glyphicon-tag"></span> {{trans('messages.assign-roles')}}</a>
						</div>
					</li>
							</ul>

						<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px; width: 215px; display: none;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px; height: 620px; display: none;"><div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div></div></div>
					</div>
				</li>

				<li class="nav_trigger">
					<a href="#">
						<span class="ion-stats-bars"></span>
						<span class="nav_title">Reports</span>
					</a>
					<div class="sub_panel" style="left: -220px;">
						<div class="side_inner ps-ready ps-container" style="height: 620px;">
							<h4 class="panel_heading panel_heading_first">{{trans('messages.daily-reports')}}</h4>
							<ul>
								<li>
									<div>
										<a href="{{ URL::route('reports.patient.index')}}">
											<span class="glyphicon glyphicon-tag"></span>
											{{trans('messages.patient-report')}}</a>
									</div>
								</li>
								<li>
									<div><a href="{{ URL::route('reports.daily.log')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.daily-log')}}</a>
									</div>
								</li>
							</ul>
							<h4 class="panel_heading panel_heading_first">{{trans('messages.aggregate-reports')}}</h4>
							<ul>
								<li>
									<div><a href="{{ URL::route('reports.aggregate.prevalence')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.prevalence-rates')}}</a>
									</div>
								</li>
								<li>
									<div><a href="{{ URL::route('reports.aggregate.surveillance')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.surveillance')}}</a>
									</div>
								</li>
								<li>
									<div><a href="{{ URL::route('reports.aggregate.counts')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.counts')}}</a>
									</div>
								</li>
								<li>
									<div><a href="{{ URL::route('reports.aggregate.tat')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.turnaround-time')}}</a>
									</div>
								</li>
								<li>
									<div><a href="{{ URL::route('reports.aggregate.infection')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.infection-report')}}</a>
									</div>
								</li>
								<li>
									<div><a href="{{ URL::route('reports.aggregate.userStatistics')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.user-statistics-report')}}</a>
									</div>
								</li>
								<li>
									<div><a href="{{ URL::route('reports.aggregate.moh706')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.moh-706')}}</a>
									</div>
								</li>					
								<li>
									<div><a href="{{ URL::route('reports.aggregate.cd4')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.cd4-report')}}</a>
									</div>
								</li>
								<li>
									<div><a href="{{ URL::route('reports.qualityControl')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{Lang::choice('messages.quality-control', 2)}}</a>
									</div>
								</li>
							</ul>
							<h4 class="panel_heading panel_heading_first">{{trans('messages.inventory-reports')}}</h4>
							<ul>
								<li>
									<div><a href="{{ URL::route('reports.inventory')}}">
										<span class="glyphicon glyphicon-tag"></span>
										{{trans('messages.stock-levels')}}</a>
									</div>
								</li>
							</ul>

						<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px; width: 215px; display: none;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px; height: 620px; display: none;"><div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div></div></div>
					</div>
				</li>


				<li class="nav_trigger">
					<a href="#">
						<span class="ion-key"></span>
						<span class="nav_title">Systems</span>
					</a>
					<div class="sub_panel" style="left: -220px;">
						<div class="side_inner ps-ready ps-container" style="height: 620px;">
							<h4 class="panel_heading panel_heading_first">External systems</h4>
							<ul>
								<li>
									<div>
										<a href="http://www.cphluganda.org/">
											<span class="glyphicon glyphicon-tag"></span> EID</a>
									</div>
								</li>
								<li>
									<div>
										<a href="http://www.cphluganda.org/">
											<span class="glyphicon glyphicon-tag"></span> Viral Load</a>
									</div>
								</li>

							</ul>

						<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px; width: 215px; display: none;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px; height: 620px; display: none;"><div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div></div></div>
					</div>
				</li>

			</ul>
		</nav>
@show
