





@page "/zipfolder"
@using System.IO.Compression

<h3>Compress and Download Folder</h3>

<button @onclick="CompressAndDownload">Compress and Download</button>

@code {
    private async Task CompressAndDownload()
    {
        string folderPath = "wwwroot/FolderToCompress"; // Path to the folder to compress
        string zipPath = "wwwroot/CompressedFolder.zip"; // Path to save the zip file

        try
        {
            if (Directory.Exists(folderPath))
            {
                // Delete the old zip file if it exists
                if (File.Exists(zipPath))
                {
                    File.Delete(zipPath);
                }

                // Compress the folder
                ZipFile.CreateFromDirectory(folderPath, zipPath);

                // Trigger the download
                var uri = new Uri(NavigationManager.BaseUri + "CompressedFolder.zip");
                NavigationManager.NavigateTo(uri.ToString(), true);
            }
            else
            {
                Console.WriteLine("Folder does not exist.");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
    
    [Inject]
    private NavigationManager NavigationManager { get; set; }
}



















@page "/zipfolder"
@using System.IO.Compression

<h3>Compress Folder to Zip</h3>

<button @onclick="CompressFolderToZip">Compress Folder</button>

@if (!string.IsNullOrEmpty(DownloadLink))
{
    <a href="@DownloadLink" download="CompressedFolder.zip">Download Zip File</a>
}

@code {
    private string? DownloadLink;

    private async Task CompressFolderToZip()
    {
        string folderPath = "wwwroot/FolderToCompress"; // Path to the folder to compress
        string zipPath = "wwwroot/CompressedFolder.zip"; // Path to save the zip file

        try
        {
            if (Directory.Exists(folderPath))
            {
                // Delete the old zip file if it exists
                if (File.Exists(zipPath))
                {
                    File.Delete(zipPath);
                }

                // Compress the folder
                ZipFile.CreateFromDirectory(folderPath, zipPath);

                // Generate a download link
                DownloadLink = "/CompressedFolder.zip";
            }
            else
            {
                Console.WriteLine("Folder does not exist.");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}















private async Task CompressFolder()
    {
        try
        {
            // Define folder and ZIP paths
            string folderPath = @"C:\YourFolderPath"; // Replace with the folder you want to compress
            string zipPath = Path.Combine(Path.GetTempPath(), "CompressedFolder.zip");

            // Delete existing ZIP file if it exists
            if (File.Exists(zipPath))
            {
                File.Delete(zipPath);
            }

            // Compress the folder into a ZIP file
            ZipFile.CreateFromDirectory(folderPath, zipPath);

            // Read the ZIP file bytes
            var zipBytes = await File.ReadAllBytesAsync(zipPath);

            // Initiate file download
            await TriggerFileDownload("CompressedFolder.zip", zipBytes);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }

    private async Task TriggerFileDownload(string fileName, byte[] fileContent)
    {
        // JavaScript Interop for downloading the file
        await using var fileStream = new MemoryStream(fileContent);
        var url = URL.CreateObjectURL(fileStream, "application/zip");

        // Create a temporary download link and trigger it
        var jsCode = $@"
            var link = document.createElement('a');
            link.href = '{url}';
            link.download = '{fileName}';
            link.click();
            URL.revokeObjectURL(link.href);
        ";
        await JSRuntime.InvokeVoidAsync("eval", jsCode);
    }











private async Task ZipAndDownload()
    {
        string folderPath = @"C:\YourFolder";
        string zipPath = @"C:\YourFolder.zip";

        // Call the method to create the zip file
        CreateZip(folderPath, zipPath);

        // Trigger download using JavaScript
        await JS.InvokeVoidAsync("downloadFile", zipPath, "YourFolder.zip");
    }

    private void CreateZip(string folderPath, string zipPath)
    {
        if (Directory.Exists(folderPath))
        {
            if (File.Exists(zipPath))
            {
                File.Delete(zipPath);
            }
            ZipFile.CreateFromDirectory(folderPath, zipPath);
        }
    }











@*  /**
 * Copyright(c) 2024 Canon Medical Systems Corporation, All Rights Reserved.
 *
 * Namespace:   MRADConfigSettings
 * Subsystem:   MRADConfigSettings
 * Module name: MRADConfigSettings.razor
 *
 * Version    Date         Auther           Comment
 * 1.0.0.0    2024/12/16   Collin Francy    Initial Version(MRAD web feasibility).
 */ *@

 @page "/"
 @using Microsoft.AspNetCore.Components.Forms
 @using System.ComponentModel.DataAnnotations
@using MRAD.ViewModel
@rendermode InteractiveServer
@inject MainWindowViewModel MRADViewModel;
@inject IJSRuntime JSRuntime

<div style="margin-top: 20px; width: 100%; max-width: 1500px; margin-left: auto; margin-right: auto; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); background-color: #333; color: #f1f1f1; border-radius: 20px;">
    <div style="padding: 20px; border-bottom: 1px solid #444;">
        <h1 style="text-align: center; font-size:50px; color:cyan">MRAD Settings Configuration</h1>
    </div>

    <div style=" display:flex;flex-direction:row;">

        <div style="width: 100%;max-width:700px; margin:10px; border: 2px solid #ccc; padding: 20px; border-radius: 10px; background-color:#505050;font-weight:bold;color:white;font-size:20px; ">
            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 20%;" for="Language">Language:</label>
                <div style="flex: 1;">
                    <select id="Language" @bind="MRADViewModel._SiteSetting.Language" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;">
                        <option value="en">en</option>
                        <option value="ja">ja</option>
                    </select>
                </div>
            </div>



            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 20%;" for="KVValue">KvRange:</label>
                <div style="flex: 1;">
                    <input type="text" id="KVValue" placeholder="Value should be in range 40 ~ 150" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                </div>
            </div>



            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 20%;" for="mATable">mATable:</label>
                <div style="flex: 1;">
                    <select id="mATable" @bind="SelectedmaNumber" class="form-select" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;">
                        @foreach (var num in matablenumbers)
                        {
                            <option value="@num">@num</option>

                        }
                    </select>
                </div>
            </div>


            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 20%;" for="msecTable">msecTable:</label>
                <div style="flex: 1;">
                    <select id="msecTable" @bind="SelectedmsecNumber" class="form-select" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;">
                        @foreach (var num in msectablevalues)
                        {
                            <option value="@num">@num</option>
                        }
                    </select>
                </div>
            </div>

            <br />
            <h3 style="color: #ffc107; margin:0">CCSNE Settings</h3>
            <hr style="border-color: #6c757d; margin:0px" />
            <br />
            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 40%;">IsEnable:</label>


                <div style="flex: 1;">
                    <select id="IsEnable" @bind="MRADViewModel._SiteSetting.CCSNE.IsEnable" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;">
                        <option>YES</option>
                        <option>NO</option>
                    </select>
                </div>

            </div>

            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 40%;" for="IPAdress">IPAdress:</label>
                <div style="flex: 1;">
                    <input type="text" @bind="MRADViewModel._SiteSetting.CCSNE.IPAdress" id="IPAdress" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                </div>
            </div>

            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 40%;" for="Port">Port:</label>
                <div style="flex: 1;">
                    <input type="text" @bind="MRADViewModel._SiteSetting.CCSNE.Port" id="Port" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                </div>
            </div>

            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 40%;" for="ReconnectInterval_ms">Reconnect Interval:</label>
                <div style="flex: 1;">
                    <input type="text" @bind="MRADViewModel._SiteSetting.CCSNE.ReconnectInterval" id="ReconnectInterval_ms" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                </div>
            </div>

            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 40%;" for="AutoThumbnailHideTime_ms">Auto Thumbnail Hide Time:</label>
                <div style="flex: 1;">
                    <input type="number" @bind="MRADViewModel._SiteSetting.CCSNE.AutoThumbnailHideTime" id="AutoThumbnailHideTime_ms" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                </div>
            </div>

            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 40%;" for="SyncWaitTimeOut_ms">Sync Wait TimeOut:</label>
                <div style="flex: 1;">
                    <input type="number" @bind="MRADViewModel._SiteSetting.CCSNE.SyncWaitTimeOut" id="SyncWaitTimeOut_ms" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                </div>
            </div>

            <br />
            <h3 style="color: #ffc107; margin:0">Window Settings</h3>
            <hr style="border-color: #6c757d; margin:0px" />
            <br />
            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 10%;" for="Width">Width:</label>
                <div style="flex: 1;">
                    <input type="number" @bind="MRADViewModel._SystemSetting.WindowSize.Width" id="Width" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                </div>
                <label style="margin-right: 10px; width: 10%;" for="Width">Height:</label>
                <div style="flex: 1;">
                    <input type="number" @bind="MRADViewModel._SystemSetting.WindowSize.Height" id="Width" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                </div>
            </div>

            <br />
            <h3 style="color: #ffc107; margin:0">Knob control step degree</h3>
            <hr style="border-color: #6c757d; margin:0px" />
            <br />
            <div style="margin-bottom: 10px; display: flex;flex-direction:column; align-items: center;">
                <div style="display:flex; flex-direction:row">
                    <div style="display:flex; flex-direction:column">
                        <label style="margin-right: 10px; width: 10%;" for="kV">kV</label>
                        <div style="flex: 1;">
                            <input type="number" @bind="MRADViewModel._SiteSetting.KnobControlStepValue.StepDegree_kV" id="kV" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" oninput="validateStepDegree(this)" />
                        </div>
                    </div>
                    <div style="display:flex; flex-direction:column">
                        <label style="margin-right: 10px; width: 10%;" for="mA">mA</label>
                        <div style="flex: 1;">
                            <input type="number" @bind="MRADViewModel._SiteSetting.KnobControlStepValue.StepDegree_mA" id="mA" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                        </div>
                    </div>
                    <div style="display:flex; flex-direction:column">
                        <label style="margin-right: 10px; width: 10%;" for="msec">msec</label>
                        <div style="flex: 1;">
                            <input type="number" @bind="MRADViewModel._SiteSetting.KnobControlStepValue.StepDegree_sec" id="msec" style="width: 80%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                        </div>
                    </div>
                </div>
                <span id="validateStepDegreespace"></span>

            </div>
        </div>

        <div style="width: 100%;max-width:700px; margin:10px; border: 2px solid #ccc; padding: 20px; border-radius: 10px; background-color:#505050;font-weight:bold;color:white;font-size:20px; ">

  @*           <div style="margin-bottom: 10px; display: flex;fill; align-items: center;">
                <label style="margin-right: 10px; width: 40%;" for="TubeCount">Tube Count:</label>
                
                    

                <input type="text" style="width:150px;background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;margin-right:40px;padding:10px;" id="TubeCount" 
                @bind="MRADViewModel._SystemSetting.TubeCount" 
                oninput="validateTubeCount(this)"  />

                <span id="validateTubeCountspace"></span>


            </div> *@

            <div style="margin-bottom: 10px;">
                <label>TubeNumber</label>

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








            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 40%;" for="DebugLog">Debug Log:</label>
                <div style="flex: 1;">
                    <div style="flex: 1;">
                        <select id="DebugLog" @bind="MRADViewModel._SystemSetting.DebugLog" style="width: 90%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;margin-right:40px;">
                            <option>ON</option>
                            <option>OFF</option>
                        </select>

                    </div>
                </div>
            </div>



            <div style="margin-bottom: 10px; display: flex; align-items: center;">
                <label style="margin-right: 10px; width: 40%;" for="AutoDeleteLogDays">Auto Delete Log Days:</label>
                <div style="flex: 1;">
                    <input type="text" id="AutoDeleteLogDays" @bind="MRADViewModel._SystemSetting.AutoDeleteLogDays" style="width: 85%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                </div>
            </div>


            <br />
            <h3 style="color: #ffc107; margin:0">TechInfo</h3>
            <hr style="border-color: #6c757d; margin:0px" />
            <br />
            <div style="display:flex;flex-direction:column; gap:5px;">
                @foreach (var tech in MRADViewModel._SystemSetting.TechData.Techs)
                {
                    <div style="display:flex;flex-direction:row; gap:20px;">
                        <label for="TechName" style="padding-top:10px;">Name:</label>
                        <input disabled type="text" id="TechName" @bind="tech.Name" style="width: 30%; padding: 10px; background-color: #505050; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />

                        <div style="display:flex;flex-direction:row;">
                            <label for="XrayTubeNumber" style="padding-top:10px" ;>TubeNo:&nbsp;</label>
                            <div style="flex: 1;">
                                <select id="XrayTubeNumber" @bind="tech.XrayTubeNumber" style="width: 90%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;margin-right:40px;">
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                            </div>
                        </div>

                        <div style="display:flex;flex-direction:row;">
                            <label for="AECChannel" style="padding-top:10px" ;>AECChannel:&nbsp;&nbsp;</label>
                            <div style="flex: 1;">
                                <select id="AECChannel" @bind="tech.AECChannel" style="width: 90%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;margin-right:40px;">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>3</option>
                                </select>
                            </div>
                        </div>
                    </div>
                }

            </div>


            <br />
            <h3 style="color: #ffc107; margin:0">DisplayInfo</h3>
            <hr style="border-color: #6c757d; margin:0px" />
            <br />
            <div>
                @foreach (var tube in MRADViewModel._SystemSetting.TubeInfo.Tubes)
                {
                    <div style="margin-bottom: 15px; padding: 10px; border: 1px solid #555; border-radius: 5px;">

@* 
                        <div style="display: grid; grid-template-columns: 1fr 2fr; align-items: center; gap: 10px; margin-bottom: 10px;">
                            <label for="TubeNumber">Tube Number
                            <input type="radio" id="TubeNumber" @bind="tube.TubeNumber" style="width: 100%; padding: 10px; background-color: #505050; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />On
                            </label>
                            <label for="TubeNumber">
                               
                                <input type="radio" id="TubeNumber" @bind="tube.TubeNumber" style="width: 100%; padding: 10px; background-color: #505050; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />OFF
                            </label>
                        </div> *@
              @*   <div style="margin-bottom: 10px;">
                            <label>TubeNumber</label>

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

 *@
                        <div style="margin-bottom: 10px;display:flex;flex-direction:row;gap:50px;">
                            <label>Tube Number:</label>
                            <input type="text" disabled @bind="tube.TubeNumber" style="width: 30%; padding: 10px; background-color: #505050; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;margin-left:8%;" />
                        
                        </div>

                        <div style="display: grid; grid-template-columns: 1fr 2fr; align-items: center; gap: 10px; margin-bottom: 10px;">
                            <label for="StartPositionX">Start Position (X):</label>
                            <input type="number" id="StartPositionX" @bind="tube.StartPositionX" style="width: 100%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                        </div>
                        <div style="display: grid; grid-template-columns: 1fr 2fr; align-items: center; gap: 10px;">
                            <label for="StartPositionY">Start Position (Y):</label>
                            <input type="number" id="StartPositionY" @bind="tube.StartPositionY" style="width: 100%; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; border-radius: 5px;" />
                        </div>
                    </div>
                }

            </div>

        </div>

    </div>

    <div style="text-align: center;">
        <button style="padding: 10px ; font-size: 15px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;" @onclick="MRADViewModel.SaveMradSettings">Save Settings</button>
        <button style="padding: 10px ; font-size: 15px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;" @onclick="MRADViewModel.ResetMradSettings">Reset Settings</button>
    </div>


</div>

@code {





    private List<int> msectablevalues { get; set; } = new List<int>
        {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 25, 28,
        32, 36, 40, 45, 50, 56, 63, 71, 80, 90, 100, 110, 125, 140, 160,
        180, 200, 220, 250, 280, 320, 360, 400, 450, 500, 560, 630, 710,
        800, 900, 1000, 1100, 1200, 1400, 1600, 1800, 2000, 2200, 2500,
        2800, 3200, 3600, 4000, 5000, 5600, 6300, 7100, 8000, 9000
        };
    private int? SelectedmsecNumber { get; set; }

    private List<int> matablenumbers { get; set; } = new List<int>
    {

        10,20,50,100,160,200,250,320,400,500,630,200,1000



    };
    private int? SelectedmaNumber { get; set; }

    private int selectedvalue = 1;
    private string selectedlang = "ja";
    private string selectedenable = "NO";









}

























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



#₹₹__&&&&-






<div style="margin-bottom: 10px; display: flex; flex-direction: column; gap: 15px;">
  <!-- CCSNE Settings Title -->
  <label style="font-weight: bold; font-size: 25px; padding-top: 10px;">CCSNE Settings</label>

  <!-- IsEnable Section -->
  <div>
    <label>IsEnable:</label>
    <div style="display: flex; flex-direction: row; gap: 20px; padding-left: 50px;">
      <EditForm Model="this">
        <InputRadioGroup @bind-Value="selectedenable">
          <div style="display: flex; flex-direction: row; gap: 20px;">
            <!-- YES Option -->
            <div style="display: flex; flex-direction: row;">
              <InputRadio Value="3"></InputRadio>
              <label>YES</label>
            </div>

            <!-- NO Option -->
            <div style="display: flex; flex-direction: row;">
              <InputRadio Value="4"></InputRadio>
              <label>NO</label>
            </div>
          </div>
        </InputRadioGroup>
      </EditForm>
    </div>
  </div>

  <!-- CCSNE Configuration Inputs -->
  <div style="display: flex; flex-direction: column; gap: 10px; padding-left: 30px; font-weight: bold;">
    <div style="display: flex; flex-direction: column; gap: 10px;">
      <!-- IP Address Input -->
      <div style="display: flex; flex-direction: row; gap: 2px;">
        <label for="IPAdress">IP Address:&nbsp</label>
        <input id="IPAdress" @bind="MRADViewModel._SiteSetting.CCSNE.IPAdress" type="text" 
               style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555; margin-left: 20px;" />
      </div>

      <!-- Port Input -->
      <div style="display: flex; flex-direction: row; gap: 2px;">
        <label for="Port">Port:&nbsp</label>
        <input type="text" id="Port" @bind="MRADViewModel._SiteSetting.CCSNE.Port" 
               style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555;" />
      </div>

      <!-- Reconnect Interval Input -->
      <div style="display: flex; flex-direction: row; gap: 2px;">
        <label for="ReconnectInterval_ms">Reconnect Interval(ms)&nbsp</label>
        <input id="ReconnectInterval_ms" @bind="MRADViewModel._SiteSetting.CCSNE.ReconnectInterval" type="text" 
               style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555;" />
      </div>
    </div>

    <!-- Time-related Inputs -->
    <div style="display: flex; flex-direction: column; gap: 20px;">
      <!-- Auto Thumbnail Hide Time Input -->
      <div style="display: flex; flex-direction: row; gap: 2px;">
        <label for="AutoThumbnailHideTime_ms">Auto Thumbnail Hide Time (ms):&nbsp</label>
        <input id="AutoThumbnailHideTime_ms" @bind="MRADViewModel._SiteSetting.CCSNE.AutoThumbnailHideTime" 
               type="number" style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555;" />
      </div>

      <!-- Sync Wait Timeout Input -->
      <div style="display: flex; flex-direction: row; gap: 2px;">
        <label for="SyncWaitTimeOut_ms">Sync Wait Timeout (ms):&nbsp</label>
        <input id="SyncWaitTimeOut_ms" @bind="MRADViewModel._SiteSetting.CCSNE.SyncWaitTimeOut" 
               type="number" style="width: 160px; padding: 10px; background-color: #444; color: #f1f1f1; border: 1px solid #555;" />
      </div>
    </div>
  </div>
</div>
