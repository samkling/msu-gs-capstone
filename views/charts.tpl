
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
              <i class="fa fa-bar-chart"></i> Average Time Per Task (Test 1)</div>
            <div class="card-body">
              <div class="row">
                <div class="col-sm-8 my-auto">
                  <canvas id="averageTimePerTask" width="100" height="50"></canvas>
                </div>
                <div class="col-sm-4 text-center my-auto">
                  <div class="h4 mb-0 text-primary">{{pdfDelta}} seconds</div>
                  <div class="small text-muted">First pdf - Second pdf</div>
                  <div class="small text-muted">First:USH | Second: HIM</div>
                  <hr>
                  <div class="h4 mb-0 text-warning">{{vPubDelta}} seconds</div>
                  <div class="small text-muted">First vPub - Second vPub</div>
                  <div class="small text-muted">First:USH | Second: HIM</div>
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


      <div class="row">
        <div class="col-lg-8">
          <!-- Example Bar Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-bar-chart"></i> Average Time Per Task (Test 1) When 4 Tasks Were Completed For Text</div>
            <div class="card-body">
              <div class="row">
                <div class="col-sm-8 my-auto">
                  <canvas id="averageTimePerTaskWhenCompleted" width="100" height="50"></canvas>
                </div>
                <div class="col-sm-4 text-center my-auto">
                  <div class="h4 mb-0 text-primary">{{pdfTest1Completed}}</div>
                  <div class="small text-muted">Participants Completed pdf Test 1 for both texts</div>
                  <hr>
                  <div class="h4 mb-0 text-warning">{{vPubTest1Completed}}</div>
                  <div class="small text-muted">Participants Completed vPub Test 1 for both texts</div>
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
              <i class="fa fa-pie-chart"></i> Robin VS. David Time Per Task vPub</div>
            <div class="card-body">
              <canvas id="robinVdavid" width="100%" height="100"></canvas>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
        </div>
      </div>


      <div class="row">
        <div class="col-lg-6">
          <!-- Example Bar Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-bar-chart"></i> How easy was the pdf to use?</div>
            <div class="card-body">
              <canvas id="pdfEasy" width="100" height="50"></canvas>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
        </div>
        <div class="col-lg-6">
          <!-- Example Bar Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-bar-chart"></i> How easy was vPub to use?</div>
            <div class="card-body">
              <canvas id="vPubEasy" width="100" height="50"></canvas>
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