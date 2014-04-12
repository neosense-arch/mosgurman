<?php
/**
 * Created by Yury Smidovich (Stmol)
 * Date: 11.03.14
 * Project: mosgurman
 * Url: http://stmol.me
 * Email: dev@stmol.me
 */

namespace Mosgurman\FrontBundle\Catalog;

use Mosgurman\FrontBundle\Catalog\ItemSettingsModel;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class ItemSettingsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('group', 'choice', array(
                'label'       => 'Группа товаров',
                'required'    => false,
                'empty_value' => false,
                'choices'     => array(
                    ItemSettingsModel::GROUP_ALL    => 'Все',
                    ItemSettingsModel::GROUP_HOT    => 'Острые',
                    ItemSettingsModel::GROUP_NOMEAT => 'Постные',
                    ItemSettingsModel::GROUP_SWEET  => 'Сладкие',
                    ItemSettingsModel::GROUP_SEASON => 'Сезонные',
                ),
            ))
            ->add('isIndex', 'checkbox', array(
                'label'    => 'На главной?',
                'required' => false,
            ))
            ->add('isNew', 'checkbox', array(
                'label'    => 'Новинка?',
                'required' => false,
            ))
            ->add('isSale', 'checkbox', array(
                'label'    => 'Скидка?',
                'required' => false,
            ))
            ->add('brief', 'ckeditor', array(
                'label'    => 'Описание',
                'required' => false,
            ))
            ->add('price', 'integer', array(
                'label'    => 'Стоимость',
                'required' => false,
            ))
            ->add('photos', 'ns_multi_image', array(
                'label'    => 'Фото',
                'required' => false
            ))
            ->add('prices', 'ns_catalog_table', array(
                'label'    => 'Торговые предложения',
                'required' => false,
                'type'     => 'sellOffer',
                'rows'     => array('weight', 'price'),
            ))
        ;
    }

    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Mosgurman\FrontBundle\Catalog\ItemSettingsModel'
        ));
    }

    /**
     * Returns the name of this type.
     *
     * @return string The name of this type
     */
    public function getName()
    {
        return 'mg_front_catalog_item_settings_type';
    }
}