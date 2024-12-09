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
