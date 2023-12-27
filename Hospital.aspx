<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Hospital.aspx.cs" Inherits="Hospital" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Begin Page Wrapper -->
    <div class="page-wrapper">
        <!-- Begin Content -->
        <div class="content container-fluid">

            <!-- Begin Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Setting</a></li>
                            <li class="breadcrumb-item"><i class="feather-chevron-right"></i></li>
                            <li class="breadcrumb-item active">Hospital</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End Page Header -->

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Hospital</h5>
                        </div>
                        <div class="card-body pt-0">
                            <div class="settings-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-block">
                                            <label>Hospital Name <span class="star-red">*</span></label>
                                            <input type="text" class="form-control" placeholder="Enter Hospital Name" id="hospName" name="hospName">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-block">
                                            <label>Hospital Phone <span class="star-red">*</span></label>
                                            <input type="number" class="form-control" placeholder="Enter Hospital Phone" id="phone" name="phone">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-block">
                                            <label>Hospital Email <span class="star-red">*</span></label>
                                            <input type="email" class="form-control" placeholder="Enter Hospital Email" id="email" name="email">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-block">
                                            <label>Hospital Address <span class="star-red">*</span></label>
                                            <input type="text" class="form-control" placeholder="Enter Hospital Address" id="address" name="address">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-block">
                                            <label>Hospital Currency Symbol <span class="star-red">*</span></label>
                                            <input type="email" class="form-control" placeholder="Enter Hospital Currency Symbol" id="currencySymbol" name="currencySymbol">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-block ">
                                            <label>Hospital Invoice Logo <span class="star-red">*</span></label>
                                                <input type="file" id="invoiceLogo" name="invoiceLogo" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-block ">
                                        <label>Hospital Logo <span class="star-red">*</span></label>
                                            <input type="file" id="hospitalLogo" name="hospitalLogo" class="form-control">
                                    </div>
                                </div>



                                <div class="input-block mb-0">
                                    <div class="settings-btns">
                                        <button type="button" class="border-0 btn btn-primary btn-gradient-primary btn-rounded" id="btnSubmit" onclick="Validation();">Submit</button>&nbsp;&nbsp;
											<button type="submit" class="btn btn-secondary btn-rounded">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <input type="hidden" id="hdnhospID" value="0" />
            <input type="hidden" id="hdnop" value="I" />

        </div>
        <!-- End Content -->
    </div>
    <!-- End Page Wrapper -->

    <!-- Toastr CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script type="text/javascript">

        var staffID = "ADM";
        var invoiceLogoStatus = "0";
        var hospitalLogoStatus = "0";

        $(document).ready(function () {
            Hospital();
        });

        // File Uploads Scripts END
        function UploadImage(fileUpload) {
            var filename = "";
            var files = fileUpload.files;

            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            var result = $.ajax({
                url: "Upload.ashx",
                type: "POST",
                data: data,
                contentType: false,
                processData: false,
                async: false
            }).responseText;
            return result
        };

        $("#invoiceLogo").click(function () {
            invoiceLogoStatus = "0";
        });

        $("#hospitalLogo").click(function () {
            hospitalLogoStatus = "0";
        });

        function Validation() {

            var hospID = $("#hdnhospID").val();
            var hospName = $("#hospName").val();
            var phone = $("#phone").val();
            var email = $("#email").val();
            var address = $("#address").val();
            var currency = $("#currencySymbol").val();
            var invoiceLogoUrl = $("#invoiceLogoUrl").css("background-image");
            var hospitalLogoUrl = $("#hospitalLogoUrl").css("background-image");
            var invoiceLogo = $("#invoiceLogo").get(0);
            var hospitalLogo = $("#hospitalLogo").get(0);
            var op = $("#hdnop").val();


            if (hospName === "") {
                toastr.error("Please Enter Hospital Name Field!!");
                $("#hospName").focus();
                return false;
            };
            if (phone === "") {
                toastr.error("Please Enter Hospital Phone Field!!");
                $("#phone").focus();
                return false;
            };
            if (email === "") {
                toastr.error("Please Enter Hospital Email Field!!");
                $("#email").focus();
                return false;
            };
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                toastr.error('Please Enter a valid Email');
                $("#email").focus();
                return false;
            };
            if (address === "") {
                toastr.error("Please Enter Hospital Address Field!!");
                $("#address").focus();
                return false;
            };
            if (currency === "") {
                toastr.error("Please Enter Hospital Currency Symbol Field!!");
                $("#currencySymbol").focus();
                return false;
            };
            if (!invoiceLogoUrl && invoiceLogo === 0) {
                toastr.error("Please Enter Hospital Invoice Logo Field!!");
                $("#invoiceLogo").focus();
                return false;
            };
            if (!hospitalLogoUrl && hospitalLogo === 0) {
                toastr.error("Please Enter Hospital Logo Field!!");
                $("#hospitalLogo").focus();
                return false;
            };

            if (invoiceLogoStatus == "0") {
                invoiceLogo = UploadImage(invoiceLogo);
            } else {
                invoiceLogo = invoiceLogoStatus;
            };

            if (hospitalLogoStatus == "0") {
                hospitalLogo = UploadImage(hospitalLogo);
            } else {
                hospitalLogo = hospitalLogoStatus;
            };

            Insert(hospID, hospName, phone, email, address, currency, invoiceLogo, hospitalLogo, staffID, op);

        }

        function Insert(hospID, hospName, phone, email, address, currency, invoiceLogo, hospitalLogo, staffID, op) {

            var data = {
                hospID: hospID,
                hospName: hospName,
                phone: phone,
                email: email,
                address: address,
                currency: currency,
                invoiceLogo: invoiceLogo,
                hospitalLogo: hospitalLogo,
                staffID: staffID,
                op: op
            };

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                url: "setting.asmx/HospitalOperation",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        var Message = data.d[i].Msg;
                        if (Message.substring(0, 6) == "Error:") {
                            toastr.error(Message);
                            return false;
                        }
                        else {
                            toastr.success(Message);
                            Hospital();
                        };
                    }
                },
                error: function (data) {

                }
            });

        }

        function Hospital() {

        }

    </script>

</asp:Content>

