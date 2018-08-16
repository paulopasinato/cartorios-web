<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro de Cartório</title>

    <script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link href="/webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/webjars/bootstrap-glyphicons/bdd2cbfba0/css/bootstrap-glyphicons.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<header>
    <nav class="navbar navbar-dark bg-dark justify-content-between">
        <spring:url value="/cartorio/todos" var="home"/>
        <a href="${home}" class="navbar-brand" style="color: #fff">Gestão de Cartórios</a>
    </nav>
</header>

<div class="container" style="margin-top: 50px">
    <h4>Cadastro de Cartório</h4>
    <div>
        <spring:url var="action" value="${empty cartorio.id ? '/cartorio/save' : '/cartorio/update'}"/>
        <form:form modelAttribute="cartorio" action="${action}" method="post">
            <form:hidden path="id"/>
            <div class="form-group">
                <label for="nome">Nome: </label>
                <form:input path="nome" class="form-control"/>
                <form:errors path="nome" cssClass="label label-danger"/>
            </div>
            <div class="form-group">
                <a href="${home}" role="button" class="btn btn-secondary">Voltar</a>
                <button type="submit" class="btn btn-primary">Confirmar</button>
                <c:if test="${not empty cartorio.id}">
                    <spring:url value="/cartorio/delete/${cartorio.id}" var="delete"/>
                    <button type="button" data-href="${delete}" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete">Excluir</button>
                </c:if>
            </div>
        </form:form>
    </div>
    <hr>
</div>

<jsp:include page="../includes/modalExclusao.jsp"/>
<script src="../../../resources/js/script.js"></script>

</body>
</html>