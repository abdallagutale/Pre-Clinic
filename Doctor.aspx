<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Doctor.aspx.cs" Inherits="Doctor" %>

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
                            <li class="breadcrumb-item active">Doctor</li>
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
                                            <h3>Doctor List</h3>
                                            <div class="doctor-search-blk ms-auto">
                                                <a class="btn btn-primary" onclick="AddDoctor();"><i class="ion-plus-circled ion-5x"></i> Add Doctor </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Table Header -->

                            <!-- Begin Table Body -->
                            <div class="table-responsive">
                                <table class="table border-0 custom-table comman-table datatable mb-0" id="DoctorTable">
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
            <div class="modal fade" id="DoctorModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <!-- Begin Modal-Dialog -->
                <div class="modal-dialog modal-lg">
                    <!-- Begin Modal-Content -->
                    <div class="modal-content">
                        <!-- Begin Modal-Header -->
                        <div class="modal-header">
                            <h4 class="modal-title" id="DoctorModalHeader">Add Doctor</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <!-- End Modal-Header -->

                        <!-- Begin Modal-Body -->
                        <div class="modal-body" id="DoctorModalBody">
                            <div class="row">
                                <div class="col-sm-12">

                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-12 col-md-6 col-xl-6">
                                                    <input type="hidden" id="hdnDocID" value="0" />
                                                    <input type="hidden" id="hdnOp" value="I" />
                                                    <div class="input-block local-forms">
                                                        <label>Doctor Name <span class="login-danger">*</span></label>
                                                        <input type="text" class="form-control" placeholder="Enter Doctor Name" id="txtDocName" name="txtDocName">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-6 col-xl-6">
                                                    <div class="input-block local-forms">
                                                        <label>Status  <span class="login-danger">*</span></label>
                                                        <select class="form-control select2" id="ddlStatus" name="ddlStatus">
                                                            <option value="0">Choose Status Doctor</option>
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
        $(document).ready(function () {
            Specialist();
            getAllDoc();
        });

        function Specialist() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: "",
                url: "Registerations.asmx/ddlSpec",
                success: function (data) {
                    $("#ddlSpec").append()
                },
            })
        }

        function getAllDoc() {

        }
    </script>

</asp:Content>

