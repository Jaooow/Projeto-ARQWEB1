<%
    if(session.getAttribute("usuario") == null){
        response.sendRedirect("error.jsp");
        return;
    }
%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="classes.Usuario" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<%
    Usuario u = (Usuario) session.getAttribute("usuario");
%>

<main class="container my-5">

    <div class="row justify-content-center">
        <div class="col-lg-6">

            <div class="card border-0 shadow-lg rounded-4">

                <!-- HEADER -->
                <div class="card-header text-white text-center p-4"
                     style="background-color:#2D6A4F; border-radius:15px 15px 0 0;">

                    <i class="bi bi-person-circle" style="font-size: 4rem;"></i>

                    <h4 class="fw-bold mt-2">Meu Perfil</h4>
                </div>

                <!-- BODY -->
                <div class="card-body p-4">

                    <form action="${pageContext.request.contextPath}/usuario" method="post">

                        <div class="mb-3">
                            <label class="fw-bold">Usuário</label>
                            <input type="text" name="login" class="form-control"
                                   value="<%= u.getLogin() %>" required readonly>
                        </div>

                        <div class="mb-3">
                            <label class="fw-bold">Senha</label>
                            <input type="password" name="senha" class="form-control"
                                   placeholder="Digite nova senha">
                        </div>

                        <div class="d-grid mt-4">
                            <button type="submit"
                                    class="btn fw-bold py-2"
                                    style="background-color:#2D6A4F; color:white;">
                                Atualizar Perfil
                            </button>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>

</main>

<c:import url="/includes/footer.jsp" />