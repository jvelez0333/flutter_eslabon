enum AlertAction {
  cancel,
  discard,
  disagree,
  agree,
}

const bool devMode = false;
const double textScaleFactor = 1.0;

//variables relacionadas a la autenticacion que son guardas en el disco
class AutenticationResponseConst{
  static  const String userName       = "userName";
  static  const String remember       = "remember";
  static  const String token          = "token";
  static  const String menuPrincipal  = "menuPrincipal";
  static  const String isLoggedIn     = "isLoggedIn";  
}

  //Todas las configuraciones relacionadas a las paginas
  class PaginaConst
    {
        //url del api de la app
        static  const String apiURL = "https://eslabon.azurewebsites.net";

            /// <summary>
            /// Pagina inicio...
            /// </summary>
            static  const String  HomePage = "/";

            /// <summary>
            /// Pagina para autenticación.
            /// </summary>
            static  const String  LoginPage = "/loginPage";

             /// <summary>
            /// Opción A. Dia de...
            /// </summary>
            static  const String  DiaDePage = "/diaDePage";

            /// <summary>
            /// Opción B. Estructura politica-territorial
            /// </summary>
            static  const String  EstructuraPolicaTerritorialPage = "/estructuraPolicaTerritorialPage";

            /// <summary>
            /// Opción C. Perfil Electoral
            /// </summary>
            static  const String  PerfilElectoralPage = "/perfilElectoralPage";

            /// <summary>
            /// Opción D. Padrón
            /// </summary>
            static  const String  BuscarEnPadronPage = "BuscarEnPadronPage";
    }