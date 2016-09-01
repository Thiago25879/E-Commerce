
<%@page import="dao.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="util.Criptografia"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="Digite abaixo";
String classe = "alert-danger";

    Cliente obj = new Cliente();
    ClienteDAO dao = new ClienteDAO();
    Criptografia cri = new Criptografia();
    
    if(request.getMethod().equals("POST")){ 
    obj.setNome(request.getParameter("txtNome"));
    obj.setEmail(request.getParameter("txtEmail"));
    obj.setSenha(cri.convertPasswordToMD5(request.getParameter("txtSenha")));  
    obj.setEndereco(request.getParameter("txtEndereco")); 
    obj.setBairro(request.getParameter("txtBairro")); 
    obj.setCidade(request.getParameter("txtCidade")); 
    obj.setEstado(request.getParameter("txtEstado")); 
    obj.setCep(request.getParameter("txtCep")); 
    if(obj == null)
{
    response.sendRedirect("index.jsp");
    return;    
}else{
        
        dao.incluir(obj);
    }
    
    Boolean resultado = dao.incluir(obj);
    if(resultado){
        msg="Registro Adicionado com Sucesso";
        classe = "alert-success";
    }else{
        msg="Não foi Possivel Adicionar";
        classe = "alert-danger";
    }   
    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Usuário
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input class="form-control" type="text" name="txtEmail" required />
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input class="form-control" type="password" name="txtSenha" required />
                    </div>
                    <div class="form-group">
                        <label>Endereco</label>
                        <input class="form-control" type="text" name="txtEndereco" required />
                    </div>
                    <div class="form-group">
                        <label>Bairro</label>
                        <input class="form-control" type="text" name="txtBairro" required />
                    </div>
                    <div class="form-group">
                        <label>Cidade</label>
                        <input class="form-control" type="text" name="txtCidade" required />
                    </div>
                    <div class="form-group">
                        <label>Estado</label>
                        <input class="form-control" type="text" name="txtEstado" maxlength="2" required />
                    </div>
                    <div class="form-group">
                        <label>Cep</label>
                        <input class="form-control" type="text" name="txtCep" maxlength="7" required />
                    </div>
                    
                    
                    


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>