<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Início - Gestão de Cartório</title>

    <script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link href="/webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/webjars/bootstrap-glyphicons/bdd2cbfba0/css/bootstrap-glyphicons.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<header>
    <nav class="navbar navbar-dark bg-dark justify-content-between">
        <a class="navbar-brand" style="color: #fff">Gestão de Cartórios</a>
    </nav>
</header>

<c:if test="${not empty message}">
    <div>
        <div class="alert alert-info" role="alert">
            <span>${message}</span>
        </div>
    </div>
</c:if>

<div class="container">
    <div class="row">
        <div class="col-md-12" style="margin-top: 50px">
            <div class="panel panel-default panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h4 class="panel-title">Cartórios</h4>
                        </div>
                        <div class="col col-xs-6 text-right">
                            <spring:url value="/cartorio/cadastro" var="cadastro"/>
                            <a role="button" href="${cadastro }" class="btn btn-sm btn-primary btn-create"><span class="glyphicon glyphicon-plus"></span> Novo Cartório</a>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <table class="table table-striped table-bordered table-list">
                        <thead>
                        <tr>
                            <th style="text-align: center"><span class="glyphicon glyphicon-cog"></span></th>
                            <th>Código</th>
                            <th>Nome</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cartorio" items="${listaCartorios}">
                            <tr>
                                <td width="15%" align="center">
                                    <spring:url value="/cartorio/update/${cartorio.id}" var="update"/>
                                    <a href="${update}" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true" data-toggle="tooltip" title="Editar"></span></a>
                                    <spring:url value="/cartorio/delete/${cartorio.id }" var="delete"/>
                                    <a data-href="${delete}" class="btn btn-default btn-sm" data-toggle="modal" data-target="#confirm-delete"><span
                                            class="glyphicon glyphicon-trash" aria-hidden="true" data-toggle="tooltip" title="Excluir"></span></a>
                                </td>

                                <td>${cartorio.id }</td>
                                <td>${cartorio.nome }</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/modalExclusao.jsp"/>
<script src="../../../resources/js/script.js"></script>

</body>

</html>