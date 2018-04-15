
<%
if show_header_footer == True:
	include header
end
%>
      <div class="row">
        <div class="col-lg-8">
          <!-- Example Bar Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-bar-chart"></i> Steps Completed in PDF Test 1 (History In The Making)</div>
            <div class="card-body">
              <div class="row">
                <div class="col-sm-8 my-auto">
                  <canvas id="pdfTest1CompleteChart" width="100" height="50"></canvas>
                </div>
                <div class="col-sm-4 text-center my-auto">
                  <div class="h4 mb-0 text-primary">0</div>
                  <div class="small text-muted">Amount Most Completed</div>
                  <hr>
                  <div class="h4 mb-0 text-warning">3</div>
                  <div class="small text-muted">Amount Least Completed</div>
                  <hr>
                  <div class="h4 mb-0 text-success">30</div>
                  <div class="small text-muted">Total Surveyed</div>
                </div>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
        </div>
        <div class="col-lg-4">
          <!-- Example Pie Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-pie-chart"></i> Preferred Mobile OS</div>
            <div class="card-body">
              <canvas id="androidOsPieChart" width="100%" height="100"></canvas>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
        </div>
      </div>


<%
if show_header_footer == True:
	include footer
end
%>