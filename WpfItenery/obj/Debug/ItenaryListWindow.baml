   M S B A M L   `   `   `  ����E  AWpfItenery, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:WpfItenery
WpfItenery  5   	   "    WpfItenery.ItenaryListWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:WpfItenery     5   	   -   5          � Title$  Iternary App��5   	   $	��450��6   $	��800��6+   .��5	      � .+�5
   
   �� -   5         ��Name$ btnNewItenary��5
      $��New Itenary��6(   $
��Left=�6>   $��52��6Y   $��	94,24,0,0q�6e   $	��Top=�6x   $	��162��6�   6�   �� 5   
   -   5        $ btnEditIternary��5      $��Edit Iternary��6*   $
��Left=�6B   $��34��6]   $��
94,331,0,0q�6i   $	��Top=�6}   $��93��6�    J� RenderTransformOrigin$ 3.159,-0.687&�6�   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ grdIteneries��5         
IsReadOnly .    SelectionMode$ Single=�6�      AreRowDetailsFrozen .    AutoGenerateColumns .  $��Center=�6�   $	��207��6  $��0,90,0,0q�6  $	��Top=�6#  $	��620��6;  ��6)   �� *
Iternaries+ �� SelectedItem 6N   �� *SelectedItenary+	 �� Mode$	 TwoWay=�
   Columns
 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ ID��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   �� *ID+6J     5      $
 Time��6%    63   �� *Time+6N     5      $ Iternary��6%    67   �� *IternaryName+6Z     5      $ About��6%    64   �� *About+6P     5      $ Price��6%    64   �� *Price+6P   5      �� 5   
   -   5        $ 	btnDelete��5      $��Delete��6$   $
��Left=�65   $��228,331,0,0q�6P   $	��Top=�6e   $��34��6}   $	��104��6�   6�   5      5      