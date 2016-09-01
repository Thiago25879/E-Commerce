<%@page import="util.Criptografia"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "Efetue Login";
    String classe = "alert-danger";
    UsuarioDAO dao = new UsuarioDAO();
    Criptografia cri = new Criptografia();

    if (request.getParameter("txtLogin") != null) {
        Usuario obj = dao.buscarPorChavePrimariaS(request.getParameter("txtLogin"));
        if (obj != null) {
            if (cri.convertPasswordToMD5(request.getParameter("txtSenha")).equals(obj.getSenha())) {
                msg = "Login efetuado com sucesso";
                classe = "alert-success";
            } else {
                msg = "Senha Errada";
                classe = "alert-danger";
            }
        } else {
            msg = "Conta não existente";
            classe = "alert-danger";
        }
    }

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Usuários

        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> listagem de registros
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">

        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>

            <a  href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Criar nova conta</a>

        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" placeholder="digite...">
                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
            </div>
        </form>
        <div class="panel-body">

            <form action="#" method="post">
                
                <div class="col-lg-6">

            <div class="table-responsive">
                <div class="form-group">
                    <label>Login</label>
                    <input class="form-control" type="text" name="txtLogin" required />
                </div>
                <div class="form-group">
                    <label>Senha</label>
                    <input class="form-control" type="password" name="txtSenha" required />
                </div>
                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
                </form>

                <!-- /.table-responsive -->
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<%@include file="../rodape.jsp" %>
