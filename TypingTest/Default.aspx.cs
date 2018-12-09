using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TypingTest
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) //only load the file the first time
            {
                Timer.Enabled = false;
                ViewState["lines"] = File.ReadAllLines(Server.MapPath("typeText.txt"));
                string[] temp = File.ReadAllLines(Server.MapPath("typeText.txt"));
                ViewState["length"] = temp.Length;
                ViewState["correctWords"] = 0;
                ViewState["wpm"] = 0;
                ViewState["numSeconds"] = 0;
                ViewState["numberRounds"] = int.Parse(DropDownList.SelectedValue);
            }
            
            
        }

        protected void Timer_Tick(object sender, EventArgs e)
        {
            int numSec = int.Parse(ViewState["numSeconds"].ToString());
            numSec++;
            ViewState["numSeconds"] = numSec;
            timeLabel.Text = ViewState["numSeconds"].ToString();
            //goodInputTB.Focus(); not good
        }


        private void roundFinished()
        {
            ViewState["numberRounds"] = int.Parse(ViewState["numberRounds"].ToString()) - 1;
            if (int.Parse(ViewState["numberRounds"].ToString())>0)
            {
                shownTextLabel.Text = findRandomText();
                goodInputTB.Focus(); //move the keyboard input directly to this text box
            } else
            {
                wpmLabel.Text = ViewState["wpm"].ToString();
                Timer.Enabled = false;
                //all done
                finishLabel.Text = "Congratulations! To play again, press start at the top.";
                ViewState["correctWords"] = 0;
                ViewState["wpm"] = 0;
                ViewState["numSeconds"] = 0;
            }
            
        }

        protected void startBtn_Click(object sender, EventArgs e)
        {
            shownTextLabel.Text = findRandomText();
            goodInputTB.Focus(); //move the keyboard input directly to this text box
            Timer.Enabled = true;
            finishLabel.Text = "";
        }

        private string findRandomText()
        {

            Random rand = new Random((int)DateTime.Now.Ticks);
            int r = rand.Next((int)ViewState["length"]);
            string[] temp = ViewState["lines"] as string[];
            return temp[r];

        }

        //called by default through the panel when user presses the enter key!
        protected void doneBtn_Click(object sender, EventArgs e)
        {

            string[] matchText = shownTextLabel.Text.Split(' ');
            string[] inputText = goodInputTB.Text.Split(' ');
            int currentMatch = 0;
            for (int i=0; i<inputText.Length; i++)
            {
                if (i >= matchText.Length)
                    break;
                if (inputText[i].Equals(matchText[i])) {
                    currentMatch++;
                }
            }

          
            ViewState["correctWords"] = int.Parse(ViewState["correctWords"].ToString()) + currentMatch;
            currentMatch = 0;
            int numSec = int.Parse(ViewState["numSeconds"].ToString());
            int correctWords = int.Parse(ViewState["correctWords"].ToString());
            int wpm = (int)(((double)correctWords / (double)numSec) * 60);
            ViewState["wpm"] = wpm.ToString();
          

            goodInputTB.Text = "";
            shownTextLabel.Text = "";
            wpmLabel.Text = wpm.ToString();

            roundFinished();
        }

        protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["numberRounds"] = int.Parse(DropDownList.SelectedValue);
        }
    }
}