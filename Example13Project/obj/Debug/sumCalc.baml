   M S B A M L   `   `   `  ����K  GExample13Project, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:Example13ProjectExample13Project  5   	       Example13Project.sumCalc   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:Example13Project     5   	   -   5          � Title$  sumCalc��5   	   $	��450��6   $	��800��6&   .��5	      �� .+�5
   
   �� -   5         ��Name$ 
lblNumber1��5
      $��27��6(    �� Left$	 224��64   $
��Wrap=�6F   $��Number 1��6Z   
 �� Top$ 59��6j   $��98��6z   $��18(�6�   $��Segoe UI Black)�6�   $��Center=�6�   $	��Top=�6�   �� 5   
   -   5        $ 
lblNumber2��5      $��43��6(   $	 224��64   $
��Wrap=�6F   $��	Number  2��6Z   $	 123��6k   $��98��6|   $��18(�6�   $��Segoe UI Black)�6�   $
��Left=�6�   $��Center=�6�   �� 5   
   -   5        $ lblSum��5      $	 224��6$   $
��Wrap=�66   $	��Sum��6J   $	 194��6U   $��28��6f   $��78��6r   $��18(�6}   $��Segoe UI Black)�6�   $��Center=�6�   $	��Top=�6�   �� 5   
   -   5         ��Name$ 
txtNumber1��5      $��35��6&   $	 366��62    �� TextWrapping$
 Wrap=�6D   $ 59��6X   $	��165��6h   $��Center=�6t   $	��Top=�6�   �� 5   
   -   5        $ 
txtNumber2��5      $��43��6&   $	 366��62   $
 Wrap=�6D   $	 123��6X   $	��165��6i   $��Center=�6u   $��Center=�6�   �� 5   
   -   5        $ txtSum��5      $��39��6"   $	 366��6.   $
 Wrap=�6@   $	 188��6T   $	��165��6e   $��Center=�6q   $	��Top=�6�   �� 5   
   -   5         ��Name$ btnSum��5      $��Find sum��6!   $��42��64   $	 424��6@   $	 257��6R   
��� ���$	��107��6v   $��20(�6�   $
��Left=�6�   $��Center=�6�   6�   5      5      