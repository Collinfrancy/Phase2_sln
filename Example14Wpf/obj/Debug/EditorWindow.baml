   M S B A M L   `   `   `  ����G  CExample14Wpf, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Example14WpfExample14Wpf  5   	       Example14Wpf.EditorWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:Example14Wpf     5   	   -   5          � Title$  EditorWindow��5   	   $	��450��6   $	��800��6+   .��5
      ]� ��. .+�5   
   �� $	��Top=�6    �� Orientation$ 
Horizontal=�6*   $��29��6C   .+�5      o� .@�5      m� -   5         m�Name$ mnuFile��5      $
��File��6,   .@�5      m� -   5        $ mnuOpen��5      $
��Open��60   6V   �� 5      m� 5      -   5        $ mnuSave��5      $
��save��60   6V   m� 5      -   5        $ mnuFont��5      $
��Font��60   6W   5      m� 5      -   5        $ mnuBackgroundColor��5      $��Background Color��67   .@�5      m� -   5        $ mnuRed��5      $	��Red��6/   6T   m� 5      -   5        $ mnuBlue��5      $
��Blue��60   6W   m� 5      -	   5        $ mnuMoreBackColor��5      $��
More color��69   6o   5      5      5      �� 5   
   $	��Top=�6   $ 
Horizontal=�6*   $��29��6C   .+�5      a� .+�5      c� .@�5"      �� -
   5         ��Name$ btnLeft��5"      $
��Left��6*   6Q   �� 5#      -   5        $ 	btnCenter��5#      $��Center��6,   6W   �� 5$      -   5        $ btnRight��5$      $��Right��6+   6T   5%      5&      5'      �� 5(   
   $��Bottom=�6   $ 
Horizontal=�6.   $��25��6G   .+�5)      �� .@�5*      �� -   5         ��Name$ 	lblStatus��5*      5+      c� 5,      $	��100��6   $	��100��6#   5.      ]� 5/   
   ��. .+�50      �� -   5         ��Name$ 	txtEditor��50       �� AcceptsReturn . $��5,5,5,5q�51   +   $��
C# and WPF��52      $	��327��6(   54      56      58      5<      