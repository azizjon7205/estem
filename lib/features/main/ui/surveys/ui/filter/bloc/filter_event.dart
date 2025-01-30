abstract class FilterEvent {

}

class OnLoadFilterAttr extends FilterEvent {

}

class OnCategorySelected extends FilterEvent {
  dynamic id;

  OnCategorySelected(this.id);
}

class OnRegionSelected extends FilterEvent {
  dynamic id;

  OnRegionSelected(this.id);
}

class OnLeftRangeChanged extends FilterEvent {
  double value;

  OnLeftRangeChanged(this.value);
}

class OnRightRangeChanged extends FilterEvent {
  double value;

  OnRightRangeChanged(this.value);
}

class OnReset extends FilterEvent {}

