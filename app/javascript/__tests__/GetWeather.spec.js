import React from 'react';
import { render } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import GetWeather from '../components/elevator_media/GetWeather';

describe('<GetWeather />', () => {
  let getByTestId;

  describe('clicking the submit button', () => {
    beforeEach(async () => {
      ({ getByTestId } = render(<GetWeather />));

      await userEvent.type(
        getByTestId('cityInput'),
        'Quebec',
      );
      userEvent.click(getByTestId('submitCity'));
    });

    it('Should be quebec', () => {
      expect(getByTestId('cityInput').value).toEqual('Quebec');
    });
  });
});