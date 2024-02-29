using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZedGraph;
using System.Drawing;
using System.Diagnostics;
using System.Windows.Forms;
using System.Reflection.Emit;


namespace ProjectBDI
{
    public partial class Graph : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        private List<string> debugMessages = new List<string>();

        protected void ZedGraphWeb1_RenderGraph(ZedGraph.Web.ZedGraphWeb webObject, System.Drawing.Graphics g, ZedGraph.MasterPane pane)
        {
         
            DataTable data = Cache["Recenzii"] as DataTable;

            if (data != null)
            {
                GraphPane mPane = pane[0];
                mPane.Title.Text = "Diamante / Reviews";
                mPane.XAxis.Title.Text = "Diamante";
                mPane.YAxis.Title.Text = "Evaluari";
                ColorSymbolRotator colorSymbolRotator = new ColorSymbolRotator();

                if (Request.QueryString["type"] != null)
                {
                    GraphPane myPane = pane[0];
                    List<string> list = new List<string>();
                    PointPairList ppList = new PointPairList();
                    Color[] colors = {
                             Color.Red, Color.Yellow, Color.Green, Color.Blue,
                             Color.Purple,Color.Pink,Color.Plum,Color.Silver, Color.Salmon
                         };
                    for (int i = 0; i < data.Rows.Count; i++)
                    {
                        DataRow row = data.Rows[i];
                        list.Add(row[0].ToString());
                        ppList.Add(i, float.Parse(row[1].ToString())); //  X-value de pe Ox
                        
                    }

               
                    switch (Request.QueryString["type"])
                    {
                        case "Bars":
                            {
                                BarItem item = mPane.AddBar("Bars", ppList, colorSymbolRotator.NextColor);
                                item.Bar.Fill = new Fill(colorSymbolRotator.NextColor);
                                item.Bar.Fill.Type = FillType.Solid;
                                item.Bar.Fill.RangeMin = 0;
                                item.Bar.Fill.RangeMax = ppList.Count;
                                mPane.XAxis.Type = AxisType.Text;
                             
                                mPane.XAxis.Scale.FontSpec.Size = 8; 
                                mPane.XAxis.Scale.TextLabels = list.ToArray();
                               
                                break;
                            }
                        case "Line":
                            {
                                LineItem curve = myPane.AddCurve("Spline", ppList, Color.Orange, SymbolType.Diamond);
                                curve.Line.IsSmooth = true;
                                curve.Line.SmoothTension = 0.5F;
                                curve.Line.Width = 2;

                                curve.Symbol.Fill = new Fill(Color.White);
                                curve.Symbol.Size = 10;

                                myPane.XAxis.Scale.TextLabels = list.ToArray();
                                myPane.XAxis.Scale.FontSpec.Angle = 50;
                                myPane.XAxis.Type = AxisType.Text;
                                break;
                            }
                        case "Pie":
                            {
                                int i = 0;
                                foreach (DataRow r in data.Rows)
                                {
                                    if (r["NumarRecenzii"] != null && !string.IsNullOrEmpty(r["NumarRecenzii"].ToString()))
                                    {
                                        double numarRecenzii = Convert.ToDouble(r["NumarRecenzii"]);
                                        double procentaj = (numarRecenzii / ppList.Count()) * 100; // Calculăm procentajul pentru etichetă
                                        string labelText = $"{r["numeDiamant"].ToString()}\n{numarRecenzii} recenzii ({procentaj:F2}%)";
                                        PieItem segment1 = myPane.AddPieSlice(numarRecenzii, colors[(i++) % colors.Length], Color.White, 45f, (i == 2) ? 0.15 : 0, labelText);
                                    }
                                }

                                debugMessages.Add("X-axis Labels: " + string.Join(", ", list));
                                debugMessages.Add("Y-axis Labels: " + string.Join(", ", ppList));
                                break;
                            }

                    }
                }
                else
                {
                    debugMessages.Add("DataTable (Recenzii) is null");
                   
                }

               
            }
        }
        

    }
}