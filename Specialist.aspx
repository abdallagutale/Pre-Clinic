<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Specialist.aspx.cs" Inherits="Specialist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Begin Page Wrapper -->
    <div class="page-wrapper">
        <!-- Begin Content -->
        <div class="content">

            <!-- Begin Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="schedule.html">Registrations</a></li>
                            <li class="breadcrumb-item"><i class="feather-chevron-right"></i></li>
                            <li class="breadcrumb-item active">Doctors</li>
                            <li class="breadcrumb-item"><i class="feather-chevron-right"></i></li>
                            <li class="breadcrumb-item active">Specialist</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End Page Header -->

            <div class="row">
                <div class="col-sm-12">

                    <div class="card card-table show-entire">
                        <div class="card-body">

                            <!-- Begin Table Header -->
                            <div class="page-table-header mb-2">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <div class="doctor-table-blk">
                                            <h3>Specialist List</h3>
                                            <div class="doctor-search-blk ms-auto">
                                                <a class="btn btn-primary" onclick="AddSpecialist();"><i class="ion-plus-circled ion-5x"></i> Add Specialist </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Table Header -->

                            <!-- Begin Table Body -->
                            <div class="table-responsive">
                                <table class="table border-0 custom-table comman-table datatable mb-0" id="SpecialistTable">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>SPC ID</th>
                                            <th>SPC Name</th>
                                            <th>Status</th>
                                            <th>ActionDate</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                            <!-- End Table Body -->

                        </div>
                    </div>
                </div>
            </div>

            <!-- Begin Modal -->
            <div class="modal fade" id="SpecialistModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <!-- Begin Modal-Dialog -->
                <div class="modal-dialog modal-lg">
                    <!-- Begin Modal-Content -->
                    <div class="modal-content">
                        <!-- Begin Modal-Header -->
                        <div class="modal-header">
                            <h4 class="modal-title" id="SpecialistModalHeader">Add Specialist</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <!-- End Modal-Header -->

                        <!-- Begin Modal-Body -->
                        <div class="modal-body" id="SpecialistModalBody">
                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-12 col-md-6 col-xl-6">
                                                    <input type="hidden" id="hdnSpecID" value="0" />
                                                    <input type="hidden" id="hdnOp" value="I" />
                                                    <div class="input-block local-forms">
                                                        <label>Specialist Name <span class="login-danger">*</span></label>
                                                        <input type="text" class="form-control" placeholder="Enter Specialist Name" id="txtSpcialist" name="txtSpcialist">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6 col-xl-6">
                                                    <div class="input-block local-forms">
                                                        <label>Status  <span class="login-danger">*</span></label>
                                                        <select class="form-control select2" id="ddlStatus" name="ddlStatus">
                                                            <option value="0">Choose Status Specialist</option>
                                                            <option value="Active">Active</option>
                                                            <option value="InActive">InActive</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="doctor-submit text-end">
                                                        <button type="button" class="btn btn-primary submit-form me-2" id="btnSubmit" onclick="Check();">Create Schedule</button>
                                                        <button type="submit" class="btn btn-primary cancel-form">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Modal-Body -->

                    </div>
                    <!-- End Modal-Content -->
                </div>
                <!-- End Modal-Dialog -->
            </div>
            <!-- End Modal -->

        </div>
        <!-- End Content -->
    </div>
    <!-- End Page Wrapper -->

    <!-- Ion Icon -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables JavaScript -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>
    <!-- Toastr CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <script type="text/javascript">

        var userID = "ADM";
        $(document).ready(function () {
            getAllSpec();
        });

        function AddSpecialist() {
            clear();
            $("#SpecialistModal").modal("show");
        }

        function Check() {

            var specID = $("#hdnSpecID").val();
            var specName = $("#txtSpcialist").val();
            var status = $("#ddlStatus").val();
            var op = $("#hdnOp").val();

            if (specName === "") {
                toastr.error("Please enter something in Specialist Name Field!!");
                $("#txtSpcialist").focus();
                return false;
            }
            if (status === "0") {
                toastr.error("Please enter something in Status Field");
                $("#ddlStatus").focus();
                return false;
            }

            SpecOperation(specID, specName, status, userID, op);
        }

        function SpecOperation(specID, specName, status, userID, op) {

            var data = {
                specID: specID,
                specName: specName,
                status: status,
                userID: userID,
                op: op
            }

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                url: "Registerations.asmx/SpecOperation",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var Message = data.d[i].Msg;
                        if (Message.substring(0, 6) == "Error:") {
                            toastr.error(Message);
                            return false;
                        }
                        else {
                            toastr.success(Message);
                            getAllSpec();
                            clear();
                        };
                    }
                },
                error: function (data) {
                    // Handle errors
                    console.error('Error loading data:');
                }
            })
        }

        function getAllSpec() {

            var DataTable = $('#SpecialistTable').DataTable();

            // Destroy the existing DataTable instance
            DataTable.destroy();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Registerations.asmx/getAllSpec",
                data: "",
                dataType: "json",
                success: function (data) {
                    // Create a new DataTable instance
                    DataTable = $('#SpecialistTable').DataTable();

                    DataTable.clear().draw();
                    var html = "";
                    for (var i = 0; i < data.d.length; i++) {
                        html += "<tr>";
                        html += "<td>" + data.d[i].SQN + "</td>";
                        html += "<td>" + data.d[i].specID + "</td>";
                        html += "<td>" + data.d[i].specName + "</td>";
                        html += "<td>" + data.d[i].status + "</td>";
                        html += "<td>" + data.d[i].actionDate + "</td>";
                        html += "<td><a onclick='editSpec(\"" + data.d[i].specID + "\")' class='rounded-circle text-sm px-2 py-1 text-end' title='Update'><i class='fas fa-pencil-alt text-success'></i></a> &nbsp;<a onclick='deleteSpec(\"" + data.d[i].specID + "\")' class='rounded-circle text-sm px-2 py-1 text-end' title='Delete'><i class='fas fa-trash text-danger'></i></a></td>";
                        html += "</tr>";
                    }
                    DataTable.rows.add($(html)).draw();
                }
            });
        }

        function editSpec(specID) {

            // Get the values from the table based on specID
            var specName = $("#SpecialistTable td:contains('" + specID + "')").next("td").text();
            var status = $("#SpecialistTable td:contains('" + specID + "')").nextAll("td:eq(1)").text();

            $("#txtSpcialist").val(specName);
            $("#ddlStatus").val(status);
            $("#hdnOp").val("U");
            $("#hdnSpecID").val(specID);
            $("#SpecialistModalHeader").text("Update Specialist");
            $("#SpecialistModal").modal("show");
        }

        function deleteSpec(specID) {

            var data = {
                specID: specID,
                specName: "",
                status: "",
                userID: "",
                op: "D",
            };

            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: false
            })

            swalWithBootstrapButtons.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        url: "Registerations.asmx/SpecOperation",
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            for (var i = 0; i < data.d.length; i++) {
                                var Message = data.d[i].Msg;
                                if (Message.substring(0, 6) == "Error:") {
                                    toastr.error(Message);
                                    return false;
                                }
                                else {
                                    toastr.success(Message);
                                    getAllSpec();
                                    clear();
                                }
                            }
                        },
                        error: function (xhr, status, e) { alert(xhr.responseText); }
                    });

                } else if (
                    result.dismiss === Swal.DismissReason.cancel
                ) {

                }
            })
        }

        function clear() {
            $("#txtSpcialist").val("");
            $("#ddlStatus").val("0");
            $("#hdnOp").val("I");
            $("#hdnSpecID").val(0);
            $("#SpecialistModalHeader").text("Add Specialist");
            $("#SpecialistModal").modal("hide");
        }

    </script>
</asp:Content>

