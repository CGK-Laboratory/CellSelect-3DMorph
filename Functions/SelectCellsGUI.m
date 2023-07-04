function varargout = SelectCellsGUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SelectCellsGUI_OpeningFcn, ...
    'gui_OutputFcn',  @SelectCellsGUI_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SelectCellsGUI is made visible.
function SelectCellsGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SelectCellsGUI (see VARARGIN)
ShowCells = evalin('base','ShowCells');
numObjSep = evalin('base','numObjMg');
FullMg = evalin('base','FullMg');
s = evalin('base','s');
zs = evalin('base','zs');
voxscale = evalin('base','voxscale');
SepObjectList = evalin('base','SepObjectList');
udSepObjectList = evalin('base','udSepObjectList');%ObjectList is large to small, flip upside down so small is plotted first in blue.
AcceptedCells = evalin('base','AcceptedCells');%ObjectList is large to small, flip upside down so small is plotted first in blue.

num = 1:3:(3*numObjSep+1);
fullimg = ones(s(1),s(2));
progbar = waitbar(0,'Plotting...');
for i = 1:numObjSep
    waitbar (i/numObjSep, progbar);
    ex=zeros(s(1),s(2),zs);
    j=udSepObjectList(i,2);
    ex(FullMg{1,j})=1;%write in only one object to image. Cells are white on black background.
    flatex = sum(ex,3);
    OutlineImage = zeros(s(1),s(2));
    OutlineImage(flatex(:,:)>1)=1;
    se = strel('diamond',4);
    Outline = imdilate(OutlineImage,se);
    fullimg(Outline(:,:)==1)=1;
    fullimg(flatex(:,:)>1)=num(1,i+1);
end
if isgraphics(progbar)
    close(progbar);
end

cmap = jet(max(fullimg(:)));
cmap(1,:) = zeros(1,3);
axes(handles.AllObjects);
imagesc(fullimg);
colormap(cmap);
colorbar('Ticks',[1,3*numObjSep+1], 'TickLabels',{'Small','Large'});
set(handles.AllObjects,'visible', 'off');

%Convert pixel sizes to unit^3
SepObjectListInUnit = round(SepObjectList(:,1)*voxscale);
CellsLabels = cell(numel(SepObjectListInUnit),1);
for i = 1:numel(SepObjectListInUnit)
    CellsLabels{i,1} = sprintf('%d - A',SepObjectListInUnit(i,1));
end
set(handles.listbox1,'String',CellsLabels);
setappdata(handles.SelectCellsGUI,'cmap',cmap);
assignin('base','cmap', getappdata(handles.SelectCellsGUI,'cmap'));
setappdata(handles.SelectCellsGUI,'SepObjectList',SepObjectList);
assignin('base','SepObjectList', getappdata(handles.SelectCellsGUI,'SepObjectList'));
setappdata(handles.SelectCellsGUI,'AcceptedCells',AcceptedCells);

% Choose default command line output for SelectCellsGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SelectCellsGUI wait for user response (see UIRESUME)
% uiwait(handles.SelectCellsGUI);


% --- Outputs from this function are returned to the command line.
function varargout = SelectCellsGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Done.
function Done_Callback(hObject, eventdata, handles)
assignin('base','AcceptedCells', getappdata(handles.SelectCellsGUI,'AcceptedCells'));
close(handles.SelectCellsGUI);


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
% numObjSep = evalin('base','numObjSep');
cmap = evalin('base','cmap');
SepObjectList = evalin('base','SepObjectList');
AllSeparatedObjs = evalin('base','AllSeparatedObjs');
SelectedValue = get(handles.listbox1,'Value');

Object = SepObjectList(SelectedValue,2);
axes(handles.SelectedObject);
imshow(AllSeparatedObjs(:,:,Object));
colormap(cmap);


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in RejectPb.
function RejectPb_Callback(hObject, eventdata, handles)
% hObject    handle to RejectPb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AcceptedCells = getappdata(handles.SelectCellsGUI,'AcceptedCells');
choosen = get(handles.listbox1,'Value');
if AcceptedCells(choosen) == true
    AcceptedCells(choosen) = false;
    CellsLabels = get(handles.listbox1,'String');
    s = CellsLabels{choosen};
    s(end) = 'R';
    CellsLabels{choosen}=s;
    set(handles.listbox1,'String',CellsLabels);
    setappdata(handles.SelectCellsGUI,'AcceptedCells',AcceptedCells);
end

% --- Executes on button press in AcceptPB.
function AcceptPB_Callback(hObject, eventdata, handles)
% hObject    handle to AcceptPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AcceptedCells = getappdata(handles.SelectCellsGUI,'AcceptedCells');
choosen = get(handles.listbox1,'Value');
if AcceptedCells(choosen) == false
    AcceptedCells(choosen) = true;
    CellsLabels = get(handles.listbox1,'String');
    s = CellsLabels{choosen};
    s(end) = 'A';
    CellsLabels{choosen}=s;
    set(handles.listbox1,'String',CellsLabels);
    setappdata(handles.SelectCellsGUI,'AcceptedCells',AcceptedCells);
end


% --- Executes on key press with focus on SelectCellsGUI or any of its controls.
function SelectCellsGUI_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to SelectCellsGUI (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.EventName, 'WindowKeyPress')
    if strcmp(eventdata.Key, 'return')
        AcceptedCells = getappdata(handles.SelectCellsGUI,'AcceptedCells');
        choosen = get(handles.listbox1,'Value');
        if AcceptedCells(choosen)
            RejectPb_Callback(hObject, eventdata, handles)
        else
            AcceptPB_Callback(hObject, eventdata, handles)
        end
    end
    
end
