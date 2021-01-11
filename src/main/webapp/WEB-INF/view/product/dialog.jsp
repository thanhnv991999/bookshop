
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Send to friend</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <lable>Sender Email</lable>
                    <input id="sender" class="form-control">
                </div>
                <div class="form-group">
                    <lable>Recipient Email</lable>
                    <input id="email" class="form-control">
                </div>
                <div class="form-group">
                    <lable>content</lable>
                    <textarea id="content" class="form-control" rows="3"></textarea>
                </div>
                <input id="id" type="hidden">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-send" data-dismiss="modal">Send</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>