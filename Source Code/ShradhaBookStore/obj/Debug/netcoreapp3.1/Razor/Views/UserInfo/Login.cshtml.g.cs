#pragma checksum "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "452853585a66e8e699bb9419ce3e9a1c059ab8d5"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_UserInfo_Login), @"mvc.1.0.view", @"/Views/UserInfo/Login.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\_ViewImports.cshtml"
using ShradhaBookStore;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\_ViewImports.cshtml"
using ShradhaBookStore.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"452853585a66e8e699bb9419ce3e9a1c059ab8d5", @"/Views/UserInfo/Login.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"1e704c6080186adbe0ec57f678afcee1579c2948", @"/Views/_ViewImports.cshtml")]
    public class Views_UserInfo_Login : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<ShradhaBookStore.Models.UserInfo>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\n");
#nullable restore
#line 3 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
   ViewBag.Title = "Login"; 

#line default
#line hidden
#nullable disable
#nullable restore
#line 4 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
   Layout = "~/Views/UserInfo/Layout/_Layout.cshtml"; 

#line default
#line hidden
#nullable disable
            WriteLiteral("<div class=\"row justify-content-md-center\">\n    <div class=\"col-md-4\">\n        <div class=\"card\">\n            <div class=\"card-header\">\n                <h1 style=\"margin-left:60px\">Login</h1>\n            </div>\n            <div class=\"card-body\">\n");
#nullable restore
#line 12 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                 using (Html.BeginForm("Login", "UserInfo", FormMethod.Post))
                {
    

#line default
#line hidden
#nullable disable
#nullable restore
#line 14 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
Write(Html.AntiForgeryToken());

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <div class=\"form-group\">\n                        ");
#nullable restore
#line 16 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                   Write(Html.LabelFor(m => m.UserName));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                        ");
#nullable restore
#line 17 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                   Write(Html.TextBoxFor(m => m.UserName, "", new { @class = "form-control", @placeholder = "Enter Your User Name" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                        ");
#nullable restore
#line 18 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                   Write(Html.ValidationMessageFor(m => m.UserName, "", new { @class = "badge badge-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                    </div>\n                                    <div class=\"form-group\">\n                                        ");
#nullable restore
#line 21 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                                   Write(Html.LabelFor(m => m.PassWord));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                                        ");
#nullable restore
#line 22 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                                   Write(Html.PasswordFor(m => m.PassWord, new { @class = "form-control", @placeholder = "Enter Your Password" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                                        ");
#nullable restore
#line 23 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                                   Write(Html.ValidationMessageFor(m => m.PassWord, "", new { @class = "badge badge-danger" }));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                                    </div>\n");
#nullable restore
#line 25 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                                                     if (ViewBag.Msg != null)
                                                    {

#line default
#line hidden
#nullable disable
            WriteLiteral("                                    <span class=\"badge badge-danger\">");
#nullable restore
#line 27 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                                                                Write(ViewBag.Msg);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span>");
#nullable restore
#line 27 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                                                                                        }

#line default
#line hidden
#nullable disable
            WriteLiteral(@"                                                                    <div class=""form-group"">
                                                                        <input type=""submit"" name=""submit"" class=""btn btn-primary"" style="" background-color: #62ab00; border-color: #62ab00"" value=""Login"" />
                                                                    </div>");
#nullable restore
#line 30 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                                                                          }

#line default
#line hidden
#nullable disable
            WriteLiteral(@"                <div class=""form-group"">
                    <p class=""margin-bottom-0"" _msthash=""748969"" _msttexthash=""1094275"">
                        You don't have a registered
                        <a r class=""btn-link-style btn-register"" style=""color: #000;text-decoration: underline;"" _istranslated=""1"">");
#nullable restore
#line 34 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
                                                                                                                              Write(Html.ActionLink("account here", "Register", "UserInfo"));

#line default
#line hidden
#nullable disable
            WriteLiteral(" </a>\n                    </p>\n                </div>\n            </div>\n            <div><a");
            BeginWriteAttribute("href", " href=\"", 2379, "\"", 2413, 1);
#nullable restore
#line 38 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
WriteAttributeValue("", 2386, Url.Action("Index","Home"), 2386, 27, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">Back to home</a></div>\n        </div>\n    </div>\n\n</div>\n");
#nullable restore
#line 43 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\UserInfo\Login.cshtml"
Write(Html.Raw(TempData["msg"]));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<ShradhaBookStore.Models.UserInfo> Html { get; private set; }
    }
}
#pragma warning restore 1591
