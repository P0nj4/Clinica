<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SideBar.ascx.cs" Inherits="SideBar" %>
<div class="page-sidebar-wrapper">
                    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                    <div class="page-sidebar navbar-collapse collapse">
                        <!-- BEGIN SIDEBAR MENU -->
                        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                        <ul class="page-sidebar-menu page-sidebar-menu-hover-submenu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                            <li class="start" ID="liDashboard" runat="server">
                                <a href="/">
                                    <i class="icon-home"></i>
                                    <span class="title">Inicio</span>
                                    <span class="selected"></span>
                                </a>
                            </li>
                            <li class="" ID="liPatients" runat="server">
                                <a href="javascript:;">
                                    <i class="icon-users"></i>
                                    <span class="title">Pacientes</span>
                                    <span class="selected"></span>
                                    <span class="arrow "></span>
                                </a>
                                <ul class="sub-menu">
                                    <li>
                                        <a href="Patients.aspx">
                                            <i class="icon-users"></i>
                                            Listado</a>
                                    </li>
                                    <li>
                                        <a href="AddPatient.aspx">
                                            <i class="icon-user-follow"></i>
                                            Agregar nuevo</a>
                                    </li>
                                </ul>
                            </li>
                            <li ID="liConsults" runat="server">
                                <a href="javascript:;">
                                    <i class="icon-notebook "></i>
                                    <span class="title">Consultas</span>
                                    <span class="selected"></span>
                                    <span class="arrow "></span>
                                </a>
                                <ul class="sub-menu">
                                    <li>
                                        <a href="Consults.aspx">
                                            <i class="icon-list"></i>
                                            Listado</a>
                                    </li>
                                    <li>
                                        <a href="Calendar.aspx">
                                            <i class="icon-calendar"></i>
                                            Calendario</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="last">
                                <a href="#">
                                    <i class="icon-bar-chart"></i>
                                    <span class="title">Estadisticas</span>
                                    <span class="arrow "></span>
                                </a>
                            </li>
                        </ul>
                        <!-- END SIDEBAR MENU -->
                    </div>
                </div>