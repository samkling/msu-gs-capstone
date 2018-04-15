<%
if show_header_footer == True:
	include header
end
%>
	
	<!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Participants</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  % for c in categories:
                    <th>{{c}}</th>
                  % end
                </tr>
              </thead>
              <tfoot>
                <tr>
                  % for c in categories:
                    <th>{{c}}</th>
                  % end
                </tr>
              </tfoot>
              <tbody>
                % for p in participants:
                  <tr>
                    % for data in p:
                      <td>{{ data }}</td>
                    % end
                  </tr>
                % end
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>



<%
if show_header_footer == True:
	include footer
end
%>