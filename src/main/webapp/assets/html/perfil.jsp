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

<%-- perfil.jsp --%>
<main class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card border-0 shadow-lg rounded-4">
                <div class="card-header text-white text-center p-4"
                     style="background-color:#2D6A4F; border-radius:15px 15px 0 0;">

                    <div class="mb-3">
                        <% if(u.getFotoBase64() != null && !u.getFotoBase64().isEmpty()) { %>
                            <img id="previewFoto" src="data:image/jpeg;base64,<%= u.getFotoBase64() %>"
                                 class="rounded-circle shadow"
                                 style="width: 120px; height: 120px; object-fit: cover; border: 4px solid white;">
                        <% } else { %>
                            <div id="containerIcone">
                                <i class="bi bi-person-circle" style="font-size: 4rem;"></i>
                            </div>
                            <img id="previewFoto" class="rounded-circle shadow d-none"
                                 style="width: 120px; height: 120px; object-fit: cover; border: 4px solid white;">
                        <% } %>
                    </div>
                    <h4 class="fw-bold mt-2">Meu Perfil</h4>
                </div>

                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/usuario" method="post" enctype="multipart/form-data">

                        <div class="mb-3">
                            <label class="fw-bold">Alterar Foto de Perfil</label>
                            <input type="file" id="inputFoto" name="foto" class="form-control" accept="image/*">
                        </div>

                        <div class="mb-3">
                            <label class="fw-bold">Usuário</label>
                            <input type="text" name="login" class="form-control"
                                   value="<%= u.getLogin() %>" required readonly> </div>

                        <div class="mb-3">
                            <label class="fw-bold">Senha</label>
                            <input type="password" name="senha" class="form-control"
                                   placeholder="Digite nova senha"> </div>

                        <div class="d-grid mt-4">
                            <button type="submit" class="btn fw-bold py-2"
                                    style="background-color:#2D6A4F; color:white;"> Atualizar Perfil
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    document.getElementById('inputFoto').addEventListener('change', function(event) {
        const file = event.target.files[0]; // Pega o arquivo selecionado
        const preview = document.getElementById('previewFoto');
        const containerIcone = document.getElementById('containerIcone');

        if (file) {
            const reader = new FileReader();

            // Quando o navegador terminar de ler o arquivo...
            reader.onload = function(e) {
                preview.src = e.target.result; // Define o src da img como o conteúdo do arquivo
                preview.classList.remove('d-none'); // Garante que a imagem apareça

                if (containerIcone) {
                    containerIcone.classList.add('d-none'); // Esconde o ícone padrão
                }
            }

            reader.readAsDataURL(file); // Lê o arquivo como uma URL (Base64 temporário)
        }
    });
</script>

<c:import url="/includes/footer.jsp" />