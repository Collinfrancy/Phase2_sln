the UI should contain the below cases:
KvRange
mATable
msecTable
CCSNE settings
KnobControl settings
Window size
 
 @page "/"

<h1>Simple Blazor UI</h1>
<div>
<div style="max-width: 400px; margin: auto; border: 1px solid #ccc; padding: 20px; border-radius: 10px;">

    <h2>Select Values</h2>

    <!-- Dropdowns -->
    @for (int i = 1; i <= 6; i++)
    {
        <div style="margin-bottom: 10px;">
            <label for="dropdown@(i)">Dropdown @(i):</label>
            <select id="dropdown@(i)" class="form-select">
                <option value="a">a</option>
                <option value="b">b</option>
                <option value="c">c</option>
                <option value="d">d</option>
                <option value="e">e</option>
                <option value="f">f</option>
            </select>
        </div>
    }

    <!-- Buttons -->
    <div style="margin-top: 20px; text-align: center;">
        <button class="btn btn-primary" style="margin-right: 10px;">Save</button>
        <button class="btn btn-secondary">Reset</button>
    </div>

</div>

1,2,3,4,5,6,7,8,9,10,11,12,14,16,18,20,22,25,28,32,36,40,45,50,56,63,71,80,90,100,110,125,140,160,180,200,220,250,280,320,360,400,450,500,560,630,710,800,900,1000,1100,1200,1400,1600,1800,2000,2200,2500,2800,3200,3600,4000,5000,5600,6300,7100,8000,9000

List<int> numbers = new List<int> 
        { 
            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 25, 28, 
            32, 36, 40, 45, 50, 56, 63, 71, 80, 90, 100, 110, 125, 140, 160, 
            180, 200, 220, 250, 280, 320, 360, 400, 450, 500, 560, 630, 710, 
            800, 900, 1000, 1100, 1200, 1400, 1600, 1800, 2000, 2200, 2500, 
            2800, 3200, 3600, 4000, 5000, 5600, 6300, 7100, 8000, 9000
        };

        DropDownList1.DataSource = numbers;




@@@@@@@@@@@@



 @page "/"
 @using Microsoft.AspNetCore.Components.Forms
 @using System.ComponentModel.DataAnnotations
 <div style="display:flex;justify-content:center;flex-direction:column;align-items:center;">
       <h1 style="display:flex;justify-content:center;font-weight:bold; padding-bottom:30px;">MRAD Configuration Settings</h1>
    <div style="border: 2px solid #ccc; width:1400px; height:850px;display:flex;flex-direction:column;">


        <div style="border: 2px solid #ccc; display:flex;flex-direction:row;">

            <div style="width: 700px; margin:10px; border: 2px solid #ccc; padding: 20px; border-radius: 10px; background-color:#505050;font-weight:bold;color:white; ">



                <div style="margin-bottom: 10px;">
                    <label>Language</label>


                    <div style="display:flex;flex-direction:row;gap:20px;padding-left:50px;">
                        <EditForm Model="this">
                            <InputRadioGroup @bind-Value="selectedlang">

                                <div style="display:flex;flex-direction:row;gap:20px;">
                                    <div style="display:flex;flex-direction:row;">
                                        <InputRadio Value="3"></InputRadio>
                                        <label>ja</label>


                                    </div>



                                    <div style="display:flex;flex-direction:row;">
                                        <InputRadio Value="4"></InputRadio>
                                        <label>en</label>


                                    </div>




                                </div>


                            </InputRadioGroup>

                        </EditForm>
                    </div>

                </div>



       <div  style="margin-bottom: 10px; display:flex;  flex-direction:column; gap:5px;"  >
            <label >KvRange</label>

            <input type="text " placeholder="Value should be in range 40 ~ 150" />
 

       </div>
    <div style="margin-bottom: 10px;">
        <label >mATable</label>
        <select  class="form-select" >
      
            <option value="a">10</option>
            <option value="b">20</option>
            <option value="c">50</option>
            <option value="d">100</option>
            <option value="e">160</option>
            <option value="f">200</option>
            <option value="g">250</option>
            <option value="h">320</option>
            <option value="i">400</option>
            <option value="j">500</option>
            <option value="k">630</option>
            <option value="l">200</option>
            <option value="m">1000</option>
        </select>
    </div>
    <div class="mm" style="margin-bottom: 10px; display:flex;  flex-direction:column; gap:5px;">
        <label>msecTable</label>
        <select @bind="SelectedNumber" class="form-select" >

           

            @foreach(var num in Numbers)
            {
                <option value="@num">@num</option>


            }
        </select>

      
    </div>


        <div style="margin-bottom: 10px; display:flex;  flex-direction:column; gap:15px;">
            <label style="font-weight:bold;font-size:25px;padding-top:10px;">CCSNE Settings</label>

            <div>
                <label>IsEnable</label>

                        <div style="display:flex;flex-direction:row;gap:20px;padding-left:50px;">
                            <EditForm Model="this">
                                <InputRadioGroup @bind-Value="selectedenable">

                                    <div style="display:flex;flex-direction:row;gap:20px;">
                                        <div style="display:flex;flex-direction:row;">
                                            <InputRadio Value="3"></InputRadio>
                                            <label>YES</label>


                                        </div>



                                        <div style="display:flex;flex-direction:row;">
                                            <InputRadio Value="4"></InputRadio>
                                            <label>NO</label>


                                        </div>




                                    </div>


                                </InputRadioGroup>

                            </EditForm>
                        </div>







            </div>

            <div style="display:flex;  flex-direction:column; gap:10px; padding-left:30px; font-weight:bold;">

               

                <div style="display:flex; flex-direction:row; gap:5px; ">

                    <div style="display:flex;  flex-direction:column; gap:2px;">
                        <label>IPAdress</label>
                        <input type="text" style="width:160px;" />
                    </div>

                    <div style="display:flex;  flex-direction:column; gap:2px;">
                        <label>Port</label>
                        <input type="number" style="width:160px" ; />
                    </div>

                            <div style="display:flex;  flex-direction:column; gap:2px;">
                                <label>ReconnectInterval_ms</label>
                                <input type="text" style="width:160px;" />
                            </div>




                           


                </div>

                        <div style="display:flex; flex-direction:row; gap:5px; ">

                <div style="display:flex;  flex-direction:column; gap:2px;">
                    <label>AutoThumbnailHideTime_ms</label>
                    <input type="number" style="width:230px;" />
                </div>
                        <div style="display:flex;  flex-direction:column; gap:2px; padding-left:10px;">
                            <label>SyncWaitTimeOut_ms</label>
                                <input type="number" style="width:230px;" />
                        </div>

                        </div>




            </div>

        </div>













    <div style="margin-bottom: 10px; display:flex; flex-direction:row; gap:5px;">

        <label style=" padding-top:30px; padding-right:20px">Window Size</label>

        <div style=" display:flex; flex-direction:column; gap:5px;">

            <label>Width</label>
            <input type="number" style="width:70px;" />


        </div>
        <div style=" display:flex; flex-direction:column; gap:5px;">

            <label>Height</label>
            <input type="number" style="width:70px;" />



        </div>

    </div>




 
  
</div>
            <div style="width: 700px; margin:10px; border: 2px solid #ccc; padding: 20px; border-radius: 10px; background-color:#505050;font-weight:bold;color:white; ">





                <div style="margin-bottom: 10px; display:flex;  flex-direction:column; gap:15px;">
                    <label style="font-weight:bold;font-size:20px;">KnobControl settings</label>

                    <div style="display:flex;  flex-direction:row; gap:5px;">
                     
                        
                        <div style="display:flex;  flex-direction:column; gap:2px;">
                            <label>kV</label>
                            <input type="number" id="numberInput" bind="InputModel.Value" oninput="ValidateNumber" class="form-control"/>
                         
                        </div>
                      
                        <div style="display:flex;  flex-direction:column; gap:2px;">
                            <label>mA</label>
                            <input type="number" />
                        </div>
                        <div style="display:flex;  flex-direction:column; gap:2px;">
                            <label>msec</label>
                            <input type="number" />
                        </div>

                    </div>

                </div>

                <div style="margin-bottom: 10px;">
                    <label>TubeCount</label>

                    <div style="display:flex;flex-direction:row;gap:20px;padding-left:50px;">
                   <EditForm Model="this">
                    <InputRadioGroup @bind-Value="selectedvalue">

                                <div style="display:flex;flex-direction:row;gap:20px;">
                                    <div style="display:flex;flex-direction:row;">
                                        <InputRadio Value="1"></InputRadio>
                                        <label>1</label>

                                    </div>

                                    <div style="display:flex;flex-direction:row;">
                                        <InputRadio Value="2"></InputRadio>
                                        <label>2</label>


                                    </div>
                     </div>

                   </InputRadioGroup>
                   </EditForm>
                    </div>      
                </div>

                <div style="margin-bottom: 10px;">
                    <label>Debuglog</label>

                    <div style="display:flex;flex-direction:row;gap:20px;padding-left:50px;">
                        <EditForm Model="this">
                            <InputRadioGroup @bind-Value="selectedvalue">

                                <div style="display:flex;flex-direction:row;gap:20px;">
                                    <div style="display:flex;flex-direction:row;">
                                        <InputRadio Value="5"></InputRadio>
                                        <label>ON</label>

                                    </div>

                                    <div style="display:flex;flex-direction:row;">
                                        <InputRadio Value="6"></InputRadio>
                                        <label>OFF</label>

                                    </div>

                                </div>

                            </InputRadioGroup>
                        </EditForm>
                    </div>

                </div>

                <div  style="margin-bottom: 10px; display:flex;  flex-direction:column; gap:5px;">
                    <label>AutoDeleteLogDays</label>
                    <input type="text" style="width:150px" />

                </div>

               <div style="display:flex;flex-direction:column; gap:5px;">
                   <label  style="padding-top:20px;padding-bottom:20px;font-weight:bold;">TechInfo</label>


                   <div style="display:flex;flex-direction:row; gap:20px;">
                       <label>Bucky1: </label>

                        <div style="display:flex;flex-direction:row;">
                            <label>TubeNo:&nbsp;&nbsp;</label>
                                      <select class="form-select">

                                            <option >1</option>
                                             <option >2</option>
                            
                                        </select>

                             </div>
                        <div style="display:flex;flex-direction:row;">
                            <label>AECChannel:&nbsp;&nbsp;</label>
                            <select class="form-select">

                                <option>0</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>

                            </select>
                        </div>
                   </div>

                    <div style="display:flex;flex-direction:row; gap:20px;">
                        <label>Bucky2: </label>

                        <div style="display:flex;flex-direction:row;">
                            <label>TubeNo:&nbsp;&nbsp;</label>
                            <select class="form-select">

                                <option>1</option>
                                <option>2</option>

                            </select>

                        </div>
                        <div style="display:flex;flex-direction:row;">
                            <label>AECChannel:&nbsp;&nbsp;</label>
                            <select class="form-select">

                                <option>0</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                            </select>

                        </div>
                    </div>
                    <div style="display:flex;flex-direction:row; gap:20px;">
                        <label>Bucky3: </label>

                        <div style="display:flex;flex-direction:row;">
                            <label>TubeNo:&nbsp;&nbsp;</label>
                            <select class="form-select">

                                <option>1</option>
                                <option>2</option>

                            </select>

                        </div>
                        <div style="display:flex;flex-direction:row;">
                            <label>AECChannel:&nbsp;&nbsp;</label>
                            <select class="form-select">

                                <option>0</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>

                            </select>

                        </div>

                    </div>

                    <div style="display:flex;flex-direction:row; gap:20px;">
                        <label>Gene1:&nbsp; </label>

                        <div style="display:flex;flex-direction:row;">
                            <label>TubeNo:&nbsp;&nbsp;&nbsp;</label>
                            <select class="form-select">

                                <option>1</option>
                                <option>2</option>

                            </select>

                        </div>
                        <div style="display:flex;flex-direction:row;">
                            <label>AECChannel:&nbsp;&nbsp;</label>
                            <select class="form-select">

                                <option>0</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>

                            </select>

                        </div>

                    </div>

                    <div style="display:flex;flex-direction:row; gap:20px;">
                        <label>Gene2:&nbsp; </label>

                        <div style="display:flex;flex-direction:row;">
                            <label>TubeNo:&nbsp;&nbsp;&nbsp;</label>
                            <select class="form-select">

                                <option>1</option>
                                <option>2</option>

                            </select>

                        </div>
                        <div style="display:flex;flex-direction:row;">
                            <label>AECChannel:&nbsp;&nbsp;</label>
                            <select class="form-select">

                                <option>0</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>

                            </select>

                        </div>

                    </div>

               </div>


                <div>
                    <label style="padding-top:20px;padding-bottom:20px;font-weight:bold;">DisplayInfo</label>


                    <div style="display:flex;flex-direction:row; gap:20px; padding-bottom:10px;">
                        <label>Tube No = 1 </label>

                        <div style="display:flex;flex-direction:row;">
                            <label>StartPos_X:</label>
                          <input type="text" style="width:120px;" />


                        </div>
                        <div style="display:flex;flex-direction:row;">
                            <label>StartPos_Y:</label>
                            <input type="text" style="width:120px;" />

                        </div>

                    </div>

                    <div style="display:flex;flex-direction:row; gap:20px;">
                        <label>Tube No = 2 </label>

                        <div style="display:flex;flex-direction:row;">
                            <label>StartPos_X:</label>
                            <input type="text" style="width:120px;" />


                        </div>
                        <div style="display:flex;flex-direction:row;">
                            <label>StartPos_Y:</label>
                            <input type="text" style="width:120px;" />

                        </div>

                    </div>


                </div>
     
            </div>

        </div>

       
        <div style="margin-top: 20px; text-align: center;">
            <button class="btn btn-primary" style="margin-right: 10px;">Save</button>
            <button class="btn btn-secondary">Reset</button>
        </div>
        
</div>
    
</div>

@code {




    // public class InputModelClass
    // {
    //     [Range(0, int.MaxValue,ErrorMessage = "Negative values are not allowed")]
    //     public int? Value { get; set; }
    // }
    private InputModel inputModel { get; set; } = new InputModel();
    private string ErrorMessage { get; set; }
    private bool HasError{ get; set; }
    public class InputModel
    {
        public int Value{ get; set; }
    }
    private void HandleValidSubmit()
    {
        Console.WriteLine($"Submitted value:{inputModel.Value}");
        ErrorMessage = string.Empty;


    }
    private void ValidateNumber(ChangeEventArgs e)
    {
        if(int.TryParse(e.Value?.ToString(),out int number))
        {
            if(number<0)
            {
                ErrorMessage = "Negative valuea are not allowed";
                HasError = true;
            }
            else
            {
                ErrorMessage = string.Empty;
                HasError = false;
            }
        }
    }
    private List<int> Numbers{ get; set; } = new List<int>
        {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 25, 28,
        32, 36, 40, 45, 50, 56, 63, 71, 80, 90, 100, 110, 125, 140, 160,
        180, 200, 220, 250, 280, 320, 360, 400, 450, 500, 560, 630, 710,
        800, 900, 1000, 1100, 1200, 1400, 1600, 1800, 2000, 2200, 2500,
        2800, 3200, 3600, 4000, 5000, 5600, 6300, 7100, 8000, 9000
        };
    private int? SelectedNumber { get; set; }

 

    private int selectedvalue = 1;
    private string selectedlang = "ja";
    private string selectedenable = "NO";

}

         





<div style="margin-bottom: 10px; display:flex;  flex-direction:column; gap:15px;">
<label style="font-weight:bold;font-size:25px;padding-top:10px;">CCSNE Settings</label>
 
     <div>
<label>IsEnable:</label>
 
         <div style="display:flex;flex-direction:row;gap:20px;padding-left:50px;">
<EditForm Model="this">
<InputRadioGroup @bind-Value="selectedenable">
 
                     <div style="display:flex;flex-direction:row;gap:20px;">
<div style="display:flex;flex-direction:row;">
<InputRadio Value="3"></InputRadio>
<label>YES</label>
 
 
                         </div>
 
 
                         <div style="display:flex;flex-direction:row;">
<InputRadio Value="4"></InputRadio>
<label>NO</label>
 
 
                         </div>
 
 
 
                     </div>
 
 
                 </InputRadioGroup>
 
             </EditForm>
</div>
 
     </div>
 
     <div style="display:flex;  flex-direction:column; gap:10px; padding-left:30px; font-weight:bold;">
 
 
         <div style="display:flex; flex-direction:column; gap:10px; ">
 
 
           
 
 
             <div style="display:flex;  flex-direction:row; gap:2px;">
<label for="IPAdress">IP Address:&nbsp</label>
<input id="IPAdress" @bind="MRADViewModel._SiteSetting.CCSNE.IPAdress" type="text" style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; margin-left:20px;"  />
</div>
<div style="display:flex;  flex-direction:row; gap:2px;">
<label for="Port">Port:&nbsp</label>
<input type="text" id="Port" @bind="MRADViewModel._SiteSetting.CCSNE.Port" style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; " />
</div>
<div style="display:flex;  flex-direction:row; gap:2px;">
<label for="ReconnectInterval_ms">Reconnect Interval(ms)&nbsp</label>
<input id="ReconnectInterval_ms" @bind="MRADViewModel._SiteSetting.CCSNE.ReconnectInterval" type="text" style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555;" />
</div>
 
 
         </div>
 
         <div style="display:flex; flex-direction:column; gap:20px; ">
 
 
             <div style="display:flex;  flex-direction:row; gap:2px;">
<label for="AutoThumbnailHideTime_ms">Auto Thumbnail Hide Time (ms):&nbsp</label>
<input id="AutoThumbnailHideTime_ms" @bind="MRADViewModel._SiteSetting.CCSNE.AutoThumbnailHideTime" type="number" style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555;" />
</div>
<div style="display:flex;  flex-direction:row; gap:2px; ">
<label for="SyncWaitTimeOut_ms">Sync Wait Timeout (ms):&nbsp</label>
<input id="SyncWaitTimeOut_ms" @bind="MRADViewModel._SiteSetting.CCSNE.SyncWaitTimeOut" type="number" style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555;" />
</div>
 
         </div>
 
 
 
     </div>
 
</div>
