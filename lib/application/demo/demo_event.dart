part of 'demo_bloc.dart';

@freezed
class DemoEvent with _$DemoEvent {
  const factory DemoEvent.demodatabase({
     String? type,
     String? name,
     String? address,
     String? phoneNo,
     String? state,
        required bool exist,

  }) = Demodatabase;
          const factory DemoEvent.fetchDemo() = FetchDemo; 

}
