#pragma checksum "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "b14cd3020932964e63e9126c7dfadb09fc39108a"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Cart2__Index), @"mvc.1.0.view", @"/Views/Cart2/_Index.cshtml")]
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
#nullable restore
#line 1 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"b14cd3020932964e63e9126c7dfadb09fc39108a", @"/Views/Cart2/_Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"1e704c6080186adbe0ec57f678afcee1579c2948", @"/Views/_ViewImports.cshtml")]
    public class Views_Cart2__Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "RemoveFromShoppingCart", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("id", new global::Microsoft.AspNetCore.Html.HtmlString("picture"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("img-fluid img-thumbnail"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("alt", new global::Microsoft.AspNetCore.Html.HtmlString("Sheep"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("<style>\n    #picture {\n    width:80px !important;\n    }\n</style>\n");
#nullable restore
#line 7 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
 if(ViewBag.GetItem == null)
{

#line default
#line hidden
#nullable disable
            WriteLiteral("<tr>\n    <td>ViewBag.Empty</td>\n    <td>ViewBag.Empty</td>\n    <td>ViewBag.Empty</td>\n    <td>ViewBag.Empty</td>\n</tr>\n");
#nullable restore
#line 15 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
}
else if (Context.Session.GetInt32("id") != null)
{
    

#line default
#line hidden
#nullable disable
#nullable restore
#line 18 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
     foreach (var item in ViewBag.GetItem)
    {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <tr>\n            <td>");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "b14cd3020932964e63e9126c7dfadb09fc39108a5769", async() => {
                WriteLiteral("<i class=\"fa fa-trash\" aria-hidden=\"true\"></i>");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            if (__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues == null)
            {
                throw new InvalidOperationException(InvalidTagHelperIndexerAssignment("asp-route-id", "Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper", "RouteValues"));
            }
            BeginWriteTagHelperAttribute();
#nullable restore
#line 21 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                         WriteLiteral(item.product.ProductCode);

#line default
#line hidden
#nullable disable
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"] = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("asp-route-id", __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"], global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("</td>\n            <td class=\"w-25 justify-content-center align-items-center\">\n                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "b14cd3020932964e63e9126c7dfadb09fc39108a8100", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "src", 2, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            AddHtmlAttributeValue("", 615, "~/images/", 615, 9, true);
#nullable restore
#line 23 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
AddHtmlAttributeValue("", 624, item.product.Picture, 624, 21, false);

#line default
#line hidden
#nullable disable
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\n            </td>\n            <td class=\"justify-content-center align-items-center\">");
#nullable restore
#line 25 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                             Write(item.product.ProductName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n            <td class=\"justify-content-center align-items-center\">");
#nullable restore
#line 26 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                             Write(item.Cart.Price.ToString("c"));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n            <td class=\"justify-content-center align-items-center\">");
#nullable restore
#line 27 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                             Write(item.Cart.Amount);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n            <td class=\"justify-content-center align-items-center\">");
#nullable restore
#line 28 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                              Write((item.Cart.Amount * item.product.Price).ToString("c"));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n        </tr>\n");
#nullable restore
#line 30 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
    }

#line default
#line hidden
#nullable disable
#nullable restore
#line 30 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
     
}
else
{
    

#line default
#line hidden
#nullable disable
#nullable restore
#line 34 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
     foreach (var item in ViewBag.GetItem)
    {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <tr>\n            <td>");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "b14cd3020932964e63e9126c7dfadb09fc39108a12035", async() => {
                WriteLiteral("<i class=\"fa fa-trash\" aria-hidden=\"true\"></i>");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            if (__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues == null)
            {
                throw new InvalidOperationException(InvalidTagHelperIndexerAssignment("asp-route-id", "Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper", "RouteValues"));
            }
            BeginWriteTagHelperAttribute();
#nullable restore
#line 37 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                         WriteLiteral(item.product.ProductCode);

#line default
#line hidden
#nullable disable
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"] = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("asp-route-id", __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"], global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("</td>\n\n            <td class=\"w-25 justify-content-center align-items-center\">\n                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "b14cd3020932964e63e9126c7dfadb09fc39108a14369", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "src", 2, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            AddHtmlAttributeValue("", 1481, "~/images/", 1481, 9, true);
#nullable restore
#line 40 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
AddHtmlAttributeValue("", 1490, item.product.Picture, 1490, 21, false);

#line default
#line hidden
#nullable disable
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\n            </td>\n            <td class=\"ssss justify-content-center align-items-center\">");
#nullable restore
#line 42 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                                  Write(item.product.ProductName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n            <td class=\"ssss justify-content-center align-items-center\">");
#nullable restore
#line 43 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                                  Write(item.product.Price.ToString("c"));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n            <td class=\"ssss justify-content-center align-items-center\">");
#nullable restore
#line 44 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                                  Write(item.Amount);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n            <td class=\"ssss justify-content-center align-items-center\">");
#nullable restore
#line 45 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
                                                                   Write((item.Amount * item.product.Price).ToString("c"));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n        </tr>\n");
#nullable restore
#line 47 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
    }

#line default
#line hidden
#nullable disable
#nullable restore
#line 47 "D:\FPT Aptech\HK 3\Eproject_Team4\Source Code\ShradhaBookStore\Views\Cart2\_Index.cshtml"
     
}

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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591