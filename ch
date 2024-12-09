the UI should contain the below cases:
KvRange
mATable
msecTable
CCSNE settings
KnobControl settings
Window size
 
 @page "/"

<h1>Simple Blazor UI</h1>

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

<h1 >MRAD Configuration Settings</h1>

<div style="max-width: 400px; margin:10px; border: 1px solid #ccc; padding: 20px; border-radius: 10px; background-color:lightyellow;  ">

   

    <!-- Dropdowns -->
  @*   @for (int i = 1; i <= 6; i++)
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
 *@

    <div  style="margin-bottom: 10px; display:flex;  flex-direction:column; gap:5px;"  >
        <label >KvRange</label>

        <input type="text " placeholder="Value should be in range 40 ~ 150" />
 

    </div>
    <div style="margin-bottom: 10px;">
        <label >mATable</label>
        <select  class="form-select" >
            <option value="" disabled selected hidden >Select a Value</option>
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

            <option value="" disabled selected hidden>Select a Value</option>

            @foreach(var num in Numbers)
            {
                <option value="@num">@num</option>


            }
        </select>

      
    </div>
    <div style="margin-bottom: 10px; display:flex;  flex-direction:column; gap:5px;">
        <label>CCSNE settings</label>
         <select  class="form-select">
            <option value="" disabled selected hidden>Select a Value</option>

            <option value="ab">Connect</option>
            <option value="ba">Disconnect</option>
        </select>


    </div>
    <div style="margin-bottom: 10px;">
        <label>KnobControl settings</label>
        <select class="form-select">
            <option value="" disabled selected hidden>Select a Value</option>

            <option value="kv">Kv</option>
            <option value="ma">mA</option>
            <option value="msec">msec</option>

        </select>
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




    <!-- Buttons -->
    <div style="margin-top: 20px; text-align: center;">
        <button class="btn btn-primary" style="margin-right: 10px;">Save</button>
        <button class="btn btn-secondary">Reset</button>
    </div>
  
</div>




@code {


    private List<int> Numbers{ get; set; } = new List<int>
        {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 25, 28,
        32, 36, 40, 45, 50, 56, 63, 71, 80, 90, 100, 110, 125, 140, 160,
        180, 200, 220, 250, 280, 320, 360, 400, 450, 500, 560, 630, 710,
        800, 900, 1000, 1100, 1200, 1400, 1600, 1800, 2000, 2200, 2500,
        2800, 3200, 3600, 4000, 5000, 5600, 6300, 7100, 8000, 9000
        };
    private int? SelectedNumber { get; set; }
  }

        

